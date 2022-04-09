class StoreBuysController < ApplicationController
  def create
    credit_card_token = request.headers["Credit-Card-Token"]
    store_buy, errors = RegisterStoreBuy.call(store_buy_params, credit_card_token)

    if errors.present?
      return render(json: errors, status: 422)
    end

    render(json: store_buy, status:  :created)
  end

  private

  def store_buy_params
    params.require(:store_buy).permit(:store, :price)
  end
end
