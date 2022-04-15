class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # validates :price, presence: true
end
