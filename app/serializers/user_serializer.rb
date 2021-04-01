class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :email
  has_many :friends
end