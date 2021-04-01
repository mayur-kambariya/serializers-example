class FriendSerializer < ActiveModel::Serializer
   attributes :name, :id, :user_id, :appreciation, :pronouns
   # has_many :interactions
   # has_many :important_dates
   has_many :notes
end 