class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :date, :rating
  has_one :user
  has_one :garden
end
