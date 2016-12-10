class Garden < ApplicationRecord
  belongs_to :user
  has_one :design
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :items
end
