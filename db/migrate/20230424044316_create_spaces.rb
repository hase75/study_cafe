class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.string :website, null: false
      t.string :station, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.boolean :private_room, null: false, default: true
      t.string :smoking, null: false
      t.boolean :wifi, null: false, default: true
      t.boolean :outlet, null: false, default: true
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
