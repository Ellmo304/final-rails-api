class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_one :garden
  has_one :user, through: :garden
end
