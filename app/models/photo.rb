class Photo < ApplicationRecord
  #写真投稿の設定
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  #geocodeの設定
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  #cocoonの設定
  has_many :products, dependent: :destroy 
  has_many :product_urls, dependent: :destroy 
  accepts_nested_attributes_for :products, :product_urls, reject_if: :all_blank, allow_destroy: true
  
  #ラベルの設定
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings

  #ajaxの設定
  has_many :comments, dependent: :destroy

  #user設定
  belongs_to :user

  #お気に入り設定
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
