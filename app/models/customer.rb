class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true, length: {minimum: 2 , maximum: 20}
  validates :email, presence: true
  
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
    end
  end
  
  def already_favorited?(space)
    self.favorites.exists?(space_id: space.id)
  end

end