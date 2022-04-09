class CreditCardRepository < RepositoryApplication
  def initialize
    @tokens_credit_cards = {
      'abc123': {
        token: 'abc123',
        account: {
          balance: 1_000_000
        }
      }
    }
  end

  def find_credit_card_by_token(token)
    @tokens_credit_cards[token]
  end
end
