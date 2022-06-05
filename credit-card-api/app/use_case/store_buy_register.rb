class StoreBuyRegister < Rails::UseCase
  attr_accessor :store_client_key, :debit_card, :user, :buy, :store

  validates :store_client_key, presence: true
  validates :debit_card, presence: true
  validates :buy, presence: true

  validate :store_buy_key_valid?
  validate :debit_card_valid?
  validte :verify_user_balance_enougth

  private def store_buy_key_valid?
    store_client = StoreClient.find_by_key(self.store_client_key)
    raise('Invalid store key') if store_client.blank?

    store = store_client.store

    raise('Store is not active to transactions') unless store.status_active?

    self.store_client = store_client
    self.store = store
  end

  private def debit_card_valid?
    debit_card = DebitCard.find_by({
      serial: self.debit_card[:serial],
      security_number: self.debit_card[:security_number],
      expire_in: self.debit_card[:expire_in],
    })

    raise('Debit cards invalid') if debit_card.blank?

    raise('User disable to transactions') unless debit_card.user.status_active?

    self.user = user
    self.debit_card = debit_card
  end

  private def verify_user_balance_enougth
    raise('User doesnt have money enougth') if Balance.check_balance_user(user, buy[:price])
  end
end
