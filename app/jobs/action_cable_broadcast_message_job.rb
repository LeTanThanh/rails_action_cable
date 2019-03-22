class ActionCableBroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform message
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room_id}_channel",
      message: render_message(message)
  end

  private

  def render_message message
    ApplicationController.render partial: "chat_rooms/user_message", locals: {message: message, user: message.user}
  end
end
