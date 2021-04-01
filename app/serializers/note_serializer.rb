class NoteSerializer < ActiveModel::Serializer
  attributes :content, :user_id, :friend_id, :id
  belongs_to :friend
end
