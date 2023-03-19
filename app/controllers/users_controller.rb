class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id) and return
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end
end
