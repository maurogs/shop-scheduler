class Shop < ApplicationRecord
  has_one :schedule, dependent: :destroy
end
