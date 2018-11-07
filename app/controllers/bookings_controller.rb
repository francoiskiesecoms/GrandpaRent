class BookingsController < ApplicationController
  def create
    @grandparent = Grandparent.find(params[:grandparent_id])
    @booking = Booking.new(booking_params)
    @booking.grandparent = @grandparent
    @booking.user = current_user
    valid_dates = (@booking.start_date >= @grandparent.start_date) && (@booking.end_date <= @grandparent.end_date)
    availability = @grandparent.bookings.all? do |booking|
      (@booking.end_date < booking.start_date) && (@booking.end_date > booking.end_date) && (@booking.start_date < booking.start_date) && (@booking.start_date > booking.end_date)
    end

    if valid_dates && availability
      @booking.save
      redirect_to grandparent_path(@grandparent)
    else

    end

  end

  def edit
    @booking = Booking.find(params[:id])
    @grandparent = Grandparent.find(params[:grandparent_id])
  end

  def update
    @grandparent = Grandparent.find(params[:grandparent_id])
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review_rating, :review_content)
  end
end
