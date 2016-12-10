class TileSerializer < ActiveModel::Serializer
  attributes :id, :type, :position
  has_one :design
end
