class FoodOrder < ApplicationRecord
  belongs_to :restaurant_food
  belongs_to :outing

  belongs_to :user
 


end
