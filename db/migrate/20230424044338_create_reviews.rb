class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :space, null: false, foreign_key: true
      t.integer     :rating, null: false, default: 0
      t.text        :comment, null: false
      
      t.index [:customer_id, :space_id], unique: true
      t.timestamps
    end
  end
end
