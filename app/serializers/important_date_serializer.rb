class ImportantDateSerializer < ActiveModel::Serializer
  attributes :title, :id, :date, :note, :reminder, :friend_id, :user_id
  belongs_to :friend
end