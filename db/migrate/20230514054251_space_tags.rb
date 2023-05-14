class SpaceTags < ActiveRecord::Migration[6.1]
  def change
    drop_table :space_tags
  end
end
