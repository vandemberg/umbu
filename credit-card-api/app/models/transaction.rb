class Transaction < ApplicationRecord
  belongs_to :sponsor, polymorphic: true
  belongs_to :beneficiary, polymorphic: true
end
