class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :navi]
  
  
  
  def show
    @photos = @user.photos
    unless @user == current_user || current_user.admin == true
      redirect_to photos_path, notice: '他人のページへアクセスはできません'
    end
  end

  def edit
    unless @user == current_user || current_user.admin == true
      redirect_to user_path(@user)
    end
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name,  :image, :image_cache)
  end
end
