class GardenSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :date
  has_one :user
  has_many :images
  has_many :comments
  has_many :items
  # has_and_belongs_to_many :items
end
