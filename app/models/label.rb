class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :photos, through: :labellings
end
