class DesignSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :garden
end
