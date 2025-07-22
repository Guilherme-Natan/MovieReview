class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, format: {  with: /\A\S+@\S+\z/  }, uniqueness: true
end
