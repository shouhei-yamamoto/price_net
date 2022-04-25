class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates :name, presence: true
end
