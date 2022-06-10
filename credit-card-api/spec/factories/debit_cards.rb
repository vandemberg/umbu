FactoryBot.define do
  factory :debit_card do
    serial_number { "MyString" }
    security_number { "MyString" }
    expire_in { "2022-06-09" }
    user { nil }
    status { 1 }
  end
end
