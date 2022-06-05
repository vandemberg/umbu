class Balance
  def self.user_has_limit_enougth_to_buy(balance, price)
    balance >= price
  end
end
