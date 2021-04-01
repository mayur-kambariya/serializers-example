class User < ApplicationRecord
  has_secure_password

  has_many :friends
  has_many :interactions
  has_many :important_dates

  validates :username, uniqueness: {case_sensitive: false}
end
