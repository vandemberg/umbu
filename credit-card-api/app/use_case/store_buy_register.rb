class StoreBuyRegister < Rails::UseCase
  attr_accessor :store, :credit_card, :buy, :credit_card_owner

  validates :store, presence: true
  validates :credit_card, presence: true
  validates :buy, presence: true

  # TODO: create the database base
  # record { CreditCardBuy.new }

  step :verify_credit_card
  step :register_buy

  private def verify_credit_card
    owner = { id: 1, name: 'vandemberg', balance: 1000 }
    credit_cards = { 'abc123': { owner: owner } }

    credit_card_key = self.credit_card[:number].to_sym
    self.credit_card_owner = credit_cards[credit_card_key][:onwer]
  end

  private def register_buy
  end
end
