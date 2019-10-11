class CreateFoodOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :food_orders do |t|
      t.text :description
      t.references :restaurant_food, null: false, foreign_key: true
      t.references :outing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
