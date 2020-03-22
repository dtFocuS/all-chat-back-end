class Api::V1::MessagesController < ApplicationController

    def index
        messages = Message.all 
        render json: messages
    end

    def create
        message = Message.new(message_params)
        room = Room.find_by(message_params['room_id']) 
        if message.save
            RoomsChannel.brodcast_to(room, {
                room: RoomSerializer.new(room),
                users: UserSerializer.new(room.users),
                messages: MessageSerializer.new(room.messages)

            }) 
        end
        render json: MessageSerializer.new(message)

    end

    private

    def message_params

        params.require(:message).permit(:room_id, :user_id, :content)
    end

end
