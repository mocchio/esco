class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications
    # @notifications.where(checked: false).each do |notification|
    #   notification.update(checked: true)
    # end
  end

  def update
    notification = Notification.find(params[:id]) 
    if notification.update(checked: true)
      @notifications = current_user.passive_notifications
      redirect_to notifications_path
    end
  end
end