require "rails_helper"

RSpec.describe "Store buy actions", :type => :request do
  let(:store_buy_params) {
    {
      store_buy: {
        store_key: 'abc123',
        buy: {
          price: 1_000
        },
        credit_card: {
          date: '10/2022',
          number: 'abc123',
          security_number: '123',
        },
      }
    }
  }

  it "register a store buy with success" do
    post "/store_buys", :params => store_buy_params

    expect(response).to have_http_status(:created)
  end
end
