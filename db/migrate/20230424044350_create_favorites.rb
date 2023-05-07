class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :customer_id, null: false, foeign_key: true
      t.integer :space_id, null: false, foreigh_key: true
      
      t.index [:customer_id, :space_id], unique: true
      t.timestamps
    end
  end
end
