class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build chat_room_params

    binding.pry

    if @chat_room.save
      flash[:success] = "Chat room is created"
      redirect_to chat_rooms_url
    else
      flash[:danger] = "Chat room isn't created"
      render :new
    end
  end

  def show
    @chat_room = ChatRoom.includes(messages: [:user]).find_by id: params[:id]
    @message = @chat_room.messages
  end

  private

  def chat_room_params
    params.require(:chat_room).permit :title
  end
end
