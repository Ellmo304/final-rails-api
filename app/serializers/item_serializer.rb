class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :image, :item_type, :description
  has_many :gardens
  # has_and_belongs_to_many :gardens
end
