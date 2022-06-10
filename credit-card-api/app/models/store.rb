class Store < ApplicationRecord
  enum status: { enable: 0, disable: 1 }
end
