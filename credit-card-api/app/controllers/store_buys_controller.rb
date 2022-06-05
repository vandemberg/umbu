class StoreBuysController < ApplicationController
  def create
    StoreBuyRegister.perform(
      store_client_key: store_client_key,
      buy: store_buy_params['buy'],
      credit_card: store_buy_params['credit_card']
    )

    render(json: {
      register_bougut: {
        uuid: '',
        date: Time.now,
        success: true,
      }
    }, status:  :created)
  end

  private

  def store_buy_params
    params.require(:store_buy).permit(
      :store_key,
      buy: [:price],
      credit_card: [:date, :number, :security_number]
    )
  end
end
