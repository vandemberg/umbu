FactoryBot.define do
  factory :transaction do
    type { "" }
    sponsor_id { "" }
    sponsor_type { "MyString" }
    beneciary_id { "" }
    beneciary_type { "MyString" }
    value { "" }
    agent { "MyString" }
  end
end
