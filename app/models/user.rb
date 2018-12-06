class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_many :demos
  has_many :comments
  has_and_belongs_to_many :bands
end
