class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  validates :rating, presence: true
  validates :body, presence: true
end
