class Genre < ApplicationRecord
  
  has_many :spaces, dependent: :destroy
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
  
end
