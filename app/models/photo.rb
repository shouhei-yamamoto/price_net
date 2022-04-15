class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :products, dependent: :destroy 
  has_many :product_urls, dependent: :destroy 
  accepts_nested_attributes_for :products, :product_urls, reject_if: :all_blank, allow_destroy: true

  # validates :price, presence: true
end
