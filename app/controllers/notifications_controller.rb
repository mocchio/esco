class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification, only: [:update, :destroy]
  
  def index
    @notifications = current_user.passive_notifications
  end

  def update
    if @notification.update(checked: true)
      @notifications = current_user.passive_notifications
      redirect_to notifications_path
    end
  end

  def destroy
    if @notification.destroy
      redirect_to notifications_path
    end
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end
end
