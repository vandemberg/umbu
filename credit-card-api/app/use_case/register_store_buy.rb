class RegisterStoreBuy
  def store_buy_register(attributes, credit_card_token)
    # validate account
    account = find_account(credit_card_token)
    raise('invalid credit card') if account.blank?

    # check available balance account
    balance = account[:balance]
    price = attributes[:price].to_i

    if not StoreBuyEntity.balance_enough_to_purchase?(balance, price)
      raise('invalid credit')
    end

    # effective the purchase
    repository = StoreBuyRepository.new
    store_buy = repository.create(attributes)
    raise(store_buy.errors) if not store_buy.valid?

    store_buy
  end

  def self.call(attributes, credit_card_token)
    store_buy = nil
    errors = nil

    begin
      register_store_buy = RegisterStoreBuy.new
      store_buy = register_store_buy.store_buy_register(attributes, credit_card_token)
    rescue StandardError => e
      errors = e.message
    end

    [store_buy, errors]
  end

  private

  def find_account(credit_card_token)
    repository = CreditCardRepository.new
    credit_card = repository.find_credit_card_by_token(credit_card_token.to_sym) || {}

    credit_card[:account]
  end
end
