class FoodOrder < ApplicationRecord
  belongs_to :restaurant_food
  belongs_to :outing
 


end
