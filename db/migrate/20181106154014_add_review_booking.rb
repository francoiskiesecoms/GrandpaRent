class AddReviewBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :review_content, :text
    add_column :bookings, :review_rating, :integer
  end
end
