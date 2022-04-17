class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  has_many :photos, dependent: :destroy

  has_many :favorites, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
end
