class CreateSpaceTags < ActiveRecord::Migration[6.1]
  def change
    create_table :space_tags do |t|
      t.integer :space_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end
  end
end
