class Grandparent < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews

end
