class StoreBuyEntity
  def self.balance_enough_to_purchase?(account_balance, store_buy_value)
    return account_balance >= store_buy_value
  end
end
