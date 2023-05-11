class Space < ApplicationRecord
  
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :space_tags, dependent: :destroy

  def average_rating
    reviews.average(:rating).to_f
  end
  
  def self.search(keyword)
    if keyword
      Space.where(["name LIKE(?) OR address LIKE(?) OR station LIKE(?) OR private_room LIKE(?) OR smoking LIKE(?) OR wifi LIKE(?) OR outlet LIKE(?)", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
    else
      Space.all
    end
  end
  
  has_one_attached :image

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
