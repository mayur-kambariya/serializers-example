class InteractionSerializer < ActiveModel::Serializer
  attributes :id, :date, :note, :friend_id, :user_id, :category
  belongs_to :friend
end