class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image
  has_many :gardens
  has_many :comments
end
