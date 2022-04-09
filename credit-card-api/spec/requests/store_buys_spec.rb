require 'rails_helper'

RSpec.describe "StoreBuys", type: :request do
  let(:store_buy_params_nil) {
    {
      store_buy: {
        store: nil,
        price: nil,
      }
    }
  }

  let(:store_buy_params) {
    {
      store_buy: {
        store: Faker::Company.name,
        price: Faker::Number.number(digits: 4),
      }
    }
  }

  let(:headers) {
    { 'Credit-Card-Token': 'abc123' }
  }

  let(:headers_invalid) {
    { 'Credit-Card-Token': '1231231' }
  }

  context "Valid requests" do
    describe "POST /create" do
      it 'Should created store buys' do
        post('/store_buys', params: store_buy_params, headers: headers)

        content = JSON.parse(response.body)

        expect(response).to have_http_status(:created)
        expect(content['store']).to eq(store_buy_params[:store_buy][:store])
        expect(content['price']).to eq(store_buy_params[:store_buy][:price])
      end
    end
  end

  context "Unvalid context" do
    describe "POST /create" do
      it 'Should NOT validate the credit card token' do
        post('/store_buys', params: store_buy_params, headers: headers_invalid)
        expect(response).to have_http_status(422)
      end

      it 'Should NOT create store buys with nil values' do
        post('/store_buys', params: store_buy_params_nil, headers: headers)

        expect(response).to have_http_status(422)
      end

      it "Should NOT create store with negative price" do
        store_buy_params[:store_buy][:store] = Faker::Company.name
        store_buy_params[:store_buy][:price] = 0

        post('/store_buys', params: store_buy_params, headers: headers)
        expect(response).to have_http_status(422)
      end

      it 'Should NOT be a valid credit' do
        attributes =  store_buy_params
        attributes[:store_buy][:price] = 1_000_000_000
        post('/store_buys', params: attributes, headers: headers)
        expect(response).to have_http_status(422)
      end
    end
  end
end
