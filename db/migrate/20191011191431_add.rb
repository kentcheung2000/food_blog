class Add < ActiveRecord::Migration[6.0]
  def change
    add_column :outings, :meeting_date, :date
  end
end
