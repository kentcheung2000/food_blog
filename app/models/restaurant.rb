class Restaurant < ApplicationRecord

  has_many :restaurant_foods, dependent: :nullify

  has_one_attached :restaurant_picture

end
