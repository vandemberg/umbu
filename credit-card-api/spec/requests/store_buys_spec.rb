require 'rails_helper'
require 'swagger_helper'

RSpec.describe "StoreBuys", type: :request do
  let(:bought) {
    {
      credit_card: {
        date: Time.now,
        number: Faker::Bank.account_number,
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
      post 'Register a bought try' do
        tags 'Store Buys'
        consumes 'application/json'

        parameter name: :bought, in: :body, schema: {
          type: :object,
          properties: {
            credit_card: {
              type: :object,
              properties: {
                date: { type: :string },
                number: { type: :string },
                security_number: { type: :string },
              },
              required: ['date', 'number', 'security_number']
            },
            partner_store: {
              type: :object,
              properties: {
                times: { type: :integer },
                price: { type: :integer },
                machine_key: { type: :string },
              },
              required: ['times', 'price', 'machine_key']
            },
          },
          required: ['credit_card', 'partner_store']
        }

        response '201', 'store buy created' do
          run_test!
        end
      end
    end
  end
end
