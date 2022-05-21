class StoreBuysController < ApplicationController
  def create
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
    params.require(:bought).permit(
      machine: [:times, :price, :machine_key],
      credit_card: [:date, :number, :security_number]
    )
  end
end
