class BookingsController < ApplicationController
  def create
    @grandparent = Grandparent.find(:grandparent_id)
    @booking = Booking.create(booking_params)
    @booking.grandparent = @grandparent
    @booking.save
    redirect_to grandparents_path
  end

  private
  def booking_params
    params.require(:booking).permit(:grandparent_id)
  end
end
