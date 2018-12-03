class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :demos
  has_many :comments
  # has_many :bands
  has_many :user_bands
  # has_many :bands, through :user_bands
end
