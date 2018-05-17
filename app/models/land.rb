class Land < ApplicationRecord
  belongs_to :user
  has_many :bookings , dependent: :destroy
  has_many :reviews , through: :bookings
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  include PgSearch
  pg_search_scope :search_by_title_and_address,
    against: [ :title, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
