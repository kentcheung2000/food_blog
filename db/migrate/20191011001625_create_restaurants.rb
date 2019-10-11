class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :longitude
      t.float :latitude
      t.string :web_address

      t.timestamps
    end
  end
end
