class User < ApplicationRecord
  enum status: { actived: 0, disabled: 1 }
end
