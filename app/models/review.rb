class Review < ApplicationRecord
  
  belongs_to :customer
  belongs_to :space
  
  validates :comment, presence: true
  validates :rating, inclusion: { in: (1..5) }
end

