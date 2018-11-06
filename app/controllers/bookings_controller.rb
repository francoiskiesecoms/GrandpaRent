class BookingsController < ApplicationController
  def create
    @grandparent         = Grandparent.find(params[:grandparent_id])
    @booking             = Booking.new
    @booking.grandparent = @grandparent
    @booking.user = current_user

    if @booking.save
      redirect_to grandparent_path(@grandparent)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @grandparent = Grandparent.find(params[:grandparent_id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:grandparent_id, :review_content, :review_rating)
  end
end
