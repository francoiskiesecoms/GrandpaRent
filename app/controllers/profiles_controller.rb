class ProfilesController < ApplicationController

  def dashboard
    @grandparent = Grandparent.new
  end
  # dashboard c'est l'équivalent de edit, le mec peut modifier ses infos

  def edit

  end
  def update
  # chope la forme du dashboard et update
  @user = current_user
  @user.update(user_params)
  end

  def show
  @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :photo)
  end
end

