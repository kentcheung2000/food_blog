class RestaurantFood < ApplicationRecord
  belongs_to :restaurant 
  has_many :food_orders, dependent: :nullify 

  has_one_attached :food_picture

end
