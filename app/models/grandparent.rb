class Grandparent < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews

end
