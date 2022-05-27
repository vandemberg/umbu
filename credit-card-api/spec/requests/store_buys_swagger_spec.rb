require 'rails_helper'
require 'swagger_helper'

RSpec.describe "StoreBuys", type: :request do
  let(:store_buy) {
    {
      store_key: "abc123",
      credit_card: {
        date: Time.now,
        code: "abc123",
        security_number: Faker::Bank.account_number(digits: 3),
      },
      partner_store: {
        price: Faker::Commerce.price,
        machine_key: Faker::IDNumber.valid,
      },
    }
  }

  path "/store_buys" do
    describe "POST /create" do
      post 'Register a store_buy try' do
        tags 'Store Buys'
        consumes 'application/json'

        parameter name: :store_buy, in: :body, schema: {
          type: :object,
          properties: {
            store_key: { type: :string },
            credit_card: {
              type: :object,
              properties: {
                date: { type: :string },
                code: { type: :string },
                security_number: { type: :string },
              },
              required: ['date', 'code', 'security_number']
            },
            buy: {
              type: :object,
              properties: {
                price: { type: :integer },
              },
              required: ['price']
            },
          },
          required: ['credit_card', 'buy']
        }

        response '201', 'store buy created' do
          run_test!
        end
      end
    end
  end
end
