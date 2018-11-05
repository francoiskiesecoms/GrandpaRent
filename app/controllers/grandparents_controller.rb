class GrandparentsController < ApplicationController
  def index
    @grandparents = Grandparent.all
    @current_user = current_user
  end

  def new
    @grandparent = Grandparent.new
  end

  def show
    @grandparent = Grandparent.find(params[:id])
    @booking = Booking.new
  end

  def create
    @grandparent = Grandparent.create
    redirect_to grandparents_path
  end

  private
  def grandparent_params
    params.require(:grandparent).permit(:name, :age, :address, :type)
  end
end

