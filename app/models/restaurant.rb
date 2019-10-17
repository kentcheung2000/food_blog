class Restaurant < ApplicationRecord

  has_many :restaurant_foods, dependent: :nullify

end
