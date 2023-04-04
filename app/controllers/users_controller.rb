class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_user

  def show
    if params[:room_id].present?
      @room = Room.find(params[:room_id])
    end
    if params[:visitor_id].present?
      @visitor = User.find(params[:visitor_id])
    end
  end

  def edit
    if current_user != @user
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id) and return
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
