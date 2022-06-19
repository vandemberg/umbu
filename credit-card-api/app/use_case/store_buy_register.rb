class StoreBuyRegister < Rails::UseCase
  attr_accessor :store_key, :debit_card, :user, :buy, :store, :transaction

  record { Transaction.new }

  validates :store_key, presence: true
  validates :debit_card, presence: true
  validates :buy, presence: true

  validate :store_buy_key_valid?
  validate :debit_card_valid?
  validate :verify_user_balance_enougth

  step :register_transaction
  # step :debit_money_from_user
  # step :credit_money_to_store
  # step :notify_user
  # step :notify_store

  def register_transaction
    @record = Transaction.create(
      origin: 'buy',
      uuid: SecureRandom.uuid,
      agent: self.store_key.key,
      sponsor: self.user,
      beneficiary: self.store,
      value: self.buy[:price].to_i,
    )

    @record.update(status: 0)
  end

  private def store_buy_key_valid?
    store_key = StoreKey.find_by_key(self.store_key)

    fail!(message: 'Essa chave é inválido. :(!', code: :invalid_store_key) if store_key.blank?

    store = store_key.store
    fail!(message: 'Loja não habilitada', code: :store_not_enable) if store_key.blank?

    self.store_key = store_key
    self.store = store
  end

  private def debit_card_valid?
    debit_card = DebitCard.where({
      serial_number: self.debit_card[:serial_number],
      security_number: self.debit_card[:security_number],
    }).where('expire_in > ?', Time.current).first

    raise('Debit cards invalid') if debit_card.blank?

    raise('User disable to transactions') if debit_card.user.disabled?

    self.user = user
    self.debit_card = debit_card
  end

  private def verify_user_balance_enougth
    return if Balances.new.user_has_limit_enougth_to_buy(10000, self.buy[:price])

    raise('User doesnt have money enougth')
  end
end
