class Comment < ApplicationRecord
  belongs_to :demo
  belongs_to :user
end
