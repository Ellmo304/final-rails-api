class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :date, :rating, :user_id
  has_one :user
  has_one :garden
end
