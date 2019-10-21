class AddUserToFoodOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :food_orders, :user, foreign_key: true

  end
end
