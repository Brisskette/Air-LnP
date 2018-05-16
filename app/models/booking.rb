class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :land
  has_many :reviews, dependent: :destroy
end
