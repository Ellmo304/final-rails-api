class Garden < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :comments
  has_and_belongs_to_many :items
end
