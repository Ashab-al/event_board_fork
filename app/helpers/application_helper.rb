module ApplicationHelper
  def user_avatar(user)
    asset_path('user.jpg')
  end
  def event_picture(event)
    asset_path('event.jpg')
  end
end
