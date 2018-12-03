class Band < ApplicationRecord
  # belongs_to :user
  has_many :user_bands
  # has_many :users, through :user_bands
end
