class AddcolumnToBookings < ActiveRecord::Migration[5.2]
  def change
     add_column :bookings, :content, :text
  end
end
