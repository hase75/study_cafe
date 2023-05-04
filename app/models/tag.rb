class Tag < ApplicationRecord
  
  has_many :space_tags, dependent: :destroy
  
end
