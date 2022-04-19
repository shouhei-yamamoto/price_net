class ProductUrl < ApplicationRecord
  belongs_to :photo
  validates :price_url, presence: true
  validates :price_url, format: /\A#{URI::regexp(%w(http https))}\z/
end
