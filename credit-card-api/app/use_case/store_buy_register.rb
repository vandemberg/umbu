class StoreBuyRegister < Rails::UseCase
  attr_accessor :store, :credit_card, :buy, :credit_card_owner

  validates :store, presence: true
  validates :credit_card, presence: true
  validates :buy, presence: true

  validate :store_buy_key_valid?
  validate :debit_card_valid?

  private def store_buy_key_valid?
    store_client = StoreClient.where({
      key: store,
    })
  end

  private def debit_card_valid?
  end
end
