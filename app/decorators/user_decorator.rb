class UserDecorator < ApplicationDecorator
  delegate_all

  def avatar_url
    "http://i.pravatar.cc/200?img=#{id}"
  end
end
