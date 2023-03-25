module NotificationsHelper
  def unchecked_notifications
    @notification = current_user.passive_notifications.where(checked: false)
  end
end
