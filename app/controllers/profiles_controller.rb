class ProfilesController < ApplicationController

  def someone_bookings

    @user = User.find(params[:id])

  end
  # dashboard c'est l'équivalent de edit, le mec peut modifier ses infos

  def edit


  end

  def update
  # chope la forme du dashboard et update
  @user = current_user
  @user.update(user_params)
  redirect_to profile_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :photo, :description)
  end
end

