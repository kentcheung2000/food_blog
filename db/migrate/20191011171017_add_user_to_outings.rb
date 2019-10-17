class AddUserToOutings < ActiveRecord::Migration[6.0]
  def change
    add_reference :outings, :user, foreign_key: true
  end
end
