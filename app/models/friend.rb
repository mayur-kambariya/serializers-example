class Friend < ApplicationRecord
  belongs_to :user   

  has_many :interactions, dependent: :destroy
  has_many :important_dates, dependent: :destroy
  has_many :notes, dependent: :destroy
end
