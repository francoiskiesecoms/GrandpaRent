class GrandparentsController < ApplicationController
  def index
    @grandparents = Grandparent.all
  end

  def new
    @grandparent = Grandparent.new
  end

  def show
    @grandparent = Grandparent.find(params[:id])
    @booking = Booking.new
  end

  def create
    @grandparent = Grandparent.create(grandparent_params)
  end

  private
  def grandparent_params
    params.require(:grandparent).permit(:name, :age, :address, :type)
  end
end

