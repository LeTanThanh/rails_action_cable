class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    chat_room_id = params["chat_room_id"]
    stream_from "chat_rooms_#{chat_room_id}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive_message_from_client data
    User.first.messages.create body: data["message"], chat_room_id: data["chat_room_id"]
  end
end
