class ProductUrl < ApplicationRecord
  belongs_to :photo
  validates :price, presence: true
end
