class Transaction < ApplicationRecord
  enum status: { processing: 0, rejected: 1, accepted: 2, canceled: 3 }

  belongs_to :sponsor, polymorphic: true
  belongs_to :beneficiary, polymorphic: true
end
