class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :telephone_number, null: false
      t.string :website, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
