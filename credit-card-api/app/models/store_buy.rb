class StoreBuy < ApplicationRecord
  validates :store, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
