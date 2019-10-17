class Change < ActiveRecord::Migration[6.0]
  def change
    change_column :outings, :meeting_time, :time
  end
end
