class TileSerializer < ActiveModel::Serializer
  attributes :id, :class_type, :position, :image
  has_one :design
end
