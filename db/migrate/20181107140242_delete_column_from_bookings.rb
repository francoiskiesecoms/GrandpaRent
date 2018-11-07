class DeleteColumnFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
    remove_column :grandparents, :start_date
    remove_column :grandparents, :end_date
  end
end
