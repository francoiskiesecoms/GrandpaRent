class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :grandparents
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def booked
  count = 0
  grandparents.each do |grandparent|
    count += grandparent.bookings.size
  end
  return count
  end

end
