class ProductUrl < ApplicationRecord
  belongs_to :photo
  validates :price_url, presence: true
end
