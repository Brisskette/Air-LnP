class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (1.. 5).to_a }
end
