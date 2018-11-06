class GrandparentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @grandparents = Grandparent.all

  end

  def new
    @grandparent = Grandparent.new
  end


  def create
    @grandparent = Grandparent.new(grandparent_params)
    @grandparent.user = current_user
    if @grandparent.save
      flash[:success] = "Content Successfully Created"
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def show
    @grandparent = Grandparent.find(params[:id])
    @booking = Booking.new
  end
  private
  def grandparent_params
    params.require(:grandparent).permit(:name, :age, :address, :speciality, :user_id, :photo)
  end
end

