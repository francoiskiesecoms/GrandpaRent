class GrandparentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def home
    @disable_nav = true
  end

  def index
    if params[:query].present?
      @grandparents = Grandparent.search_by_address(params[:query])
    else
      @grandparents = Grandparent.all
    end

    @grandparentsmap = Grandparent.where.not(latitude: nil, longitude: nil)

    @markers = @grandparentsmap.map do |gdp|
      {
        lat: gdp.latitude,
        lng: gdp.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }

    end
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
    @markers =
       [{
        lat: @grandparent.latitude,
        lng: @grandparent.longitude
        #,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
  end

  def edit
    @grandparent = Grandparent.find(params[:id])

  end

  def update
    @grandparent = Grandparent.find(params[:id])
    @grandparent.update(grandparent_params)
    if @grandparent.save
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @grandparent = Grandparent.find(params[:id])
    @grandparent.destroy
    redirect_to profile_path
  end
  private
  def grandparent_params
    params.require(:grandparent).permit(:name, :age, :address, :speciality, :user_id, :picture, :picture_cache, :start_date, :end_date)
  end
end

