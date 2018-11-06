class AddRatingToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :rating, :integer
  end
end
