

class BookingsController < ApplicationController
  def create

    @grandparent = Grandparent.find(params[:grandparent_id])
    @booking = Booking.new
    @booking.start_date = convert_to(booking_params[:start_date])
    @booking.end_date = convert_to(booking_params[:end_date])
    @booking.grandparent = @grandparent
    @booking.user = current_user

    # have to check start and end dates of grandparent

    valid_dates = (@booking.start_date >= @grandparent.start_date) && (@booking.end_date <= @grandparent.end_date)
    availability = @grandparent.bookings.all? do |booking|
      (@booking.start_date < booking.start_date && @booking.end_date < booking.start_date) || (@booking.start_date > booking.end_date && @booking.end_date > booking.end_date)
    end

    if valid_dates && availability
      @booking.save
      flash[:alert] = "Congrats for your booking!!!"
      redirect_to grandparent_path(@grandparent)
    elsif !(valid_dates)
      flash[:alert] = "Not for rent at this time!!"
      redirect_to grandparent_path(@grandparent)
    elsif !(availability)
      flash[:alert] = "Already booked at that time!!"
      redirect_to grandparent_path(@grandparent)
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
      redirect_to someonebo_path(@grandparent.user)
    else
      render :edit
    end
  end

  def index
    @grandparent = Grandparent.find(params[:grandparent_id])
    @bookings = @grandparent.bookings
  end

  def show
    @user = User.find(params[:user_id])
  end

  private

  def convert_to(date_string)
    parsed = Date.strptime(date_string, "%m/%d/%Y")
    parsed
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review_rating, :review_content)
  end
end
