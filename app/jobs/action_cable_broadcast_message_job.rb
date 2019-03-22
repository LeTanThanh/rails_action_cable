class ActionCableBroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform message
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room_id}_channel",
      user_message_id: message.user_id,
      user_message: render_user_message(message),
      other_user_message: render_other_user_message(message)
  end

  private

  def render_user_message message
    ApplicationController.render partial: "chat_rooms/user_message", locals: {message: message, user: message.user}
  end

  def render_other_user_message message
    ApplicationController.render partial: "chat_rooms/other_user_message", locals: {message: message, user: message.user}
  end
end
