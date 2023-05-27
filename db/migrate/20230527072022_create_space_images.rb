class CreateSpaceImages < ActiveRecord::Migration[6.1]
  def change
    create_table :space_images do |t|
      t.integer :space_id, null: false
      t.string :image
      t.timestamps
    end
  end
end
