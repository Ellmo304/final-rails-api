class TileSerializer < ActiveModel::Serializer
  attributes :id, :class_type, :position
  has_one :design
end
