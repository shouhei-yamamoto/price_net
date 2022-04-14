class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  # validates :price, presence: true
end
