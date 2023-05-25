class Favorite < ApplicationRecord
  
  belongs_to :customer
  belongs_to :space
  
  validates_uniqueness_of :space_id, scope: :customer_id
  
end