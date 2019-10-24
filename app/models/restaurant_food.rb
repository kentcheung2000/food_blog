class RestaurantFood < ApplicationRecord
  belongs_to :restaurant 
  has_many :food_orders, dependent: :nullify 

end
