class RemoveColumnFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :content
    remove_column :bookings, :rating
  end
end
