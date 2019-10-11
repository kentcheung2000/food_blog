class CreateOutings < ActiveRecord::Migration[6.0]
  def change
    create_table :outings do |t|
      t.text :description
      t.datetime :meeting_time
      t.float :total
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
