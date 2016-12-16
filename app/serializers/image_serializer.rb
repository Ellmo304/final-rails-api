class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_one :garden
end
