class Grandparent < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_address,
    against: [ :address],
    using: {
      tsearch: { prefix: true }
    }
end
