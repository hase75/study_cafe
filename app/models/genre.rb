class Genre < ApplicationRecord
  
  has_many :spaces, dependent: :destroy
  
end
