class DesignSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :garden
  has_one :user, through: :garden
  has_many :tiles
end
