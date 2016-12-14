class GardenSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date, :likes
  has_one :user
  has_many :images
  has_many :comments
  has_many :items
  has_one :design
  # has_and_belongs_to_many :items
end
