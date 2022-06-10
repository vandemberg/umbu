class StoreBuyRegister < Rails::UseCase
  attr_accessor :store_key, :debit_card, :user, :buy, :store

  validates :store_key, presence: true
  validates :debit_card, presence: true
  validates :buy, presence: true

  validate :store_buy_key_valid?
  validate :debit_card_valid?
  validate :verify_user_balance_enougth

  private def store_buy_key_valid?
    store_key = StoreKey.find_by_key(self.store_key)

    fail!(message: 'Essa chave é inválido. :(!', code: :invalid_store_key) if store_key.blank?

    store = store_key.store
    fail!(message: 'Loja não habilitada', code: :store_not_enable) if store_key.blank?

    self.store_key = store_key
    self.store = store
  end

  private def debit_card_valid?
    debit_card = DebitCard.find_by({
      serial_number: self.debit_card[:serial_number],
      security_number: self.debit_card[:security_number],
      expire_in: self.debit_card[:expire_in],
    })

    raise('Debit cards invalid') if debit_card.blank?

    raise('User disable to transactions') unless debit_card.user.status_active?

    self.user = user
    self.debit_card = debit_card
  end

  private def verify_user_balance_enougth
    raise('User doesnt have money enougth') if Balances.check_balance_user(user, buy[:price])
  end
end
