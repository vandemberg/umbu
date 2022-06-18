class StoreBuysController < ApplicationController
  def create
    result = StoreBuyRegister.perform(
      store_key: store_buy_params[:store_key],
      buy: store_buy_params[:buy],
      debit_card: store_buy_params[:debit_card]
    )

    unless result.success
      return render(json: result, status: 400)
    end

    render(json: {
      register_bougut: {
        uuid: result.record.uuid,
        date: result.record.created_at,
        success: true,
      }
    }, status:  :created)
  end

  private

  def store_buy_params
    params.require(:store_buy).permit(
      :store_key,
      buy: [:price],
      debit_card: [:expire_in, :serial_number, :security_number]
    )
  end
end
