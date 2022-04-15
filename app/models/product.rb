class Product < ApplicationRecord
  belongs_to :photo
  validates :price, presence: true
end
