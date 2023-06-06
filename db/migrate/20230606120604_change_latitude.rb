class ChangeLatitude < ActiveRecord::Migration[6.1]
  def change
    change_column :spaces, :latitude, :decimal, precision: 11, scale: 8, null: false
  end
end
