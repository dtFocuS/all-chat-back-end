class Api::V1::MessagesController < ApplicationController

    def index
        messages = Message.all 
        render json: messages
    end

    def create
        message = Message.new(message_params)
        
       

        room = Room.find_by_id(message_params['room_id']) 
        if message.save
            # byebug
            RoomsChannel.broadcast_to(room, {
                room: RoomSerializer.new(room),
                users: room.users,
                messages:  room.messages

            }) 
        end
        render json: { message: MessageSerializer.new(message) }
        # message = Message.new(message_params)
        # room = Room.find(message_params[:room_id])
        # if message.save
        #     serialized_data = ActiveModelSerializers::Adapter::Json.new(
        #         MessageSerializer.new(message)
        #     ).serializable_hash
        #     RoomsChannel.broadcast_to room, serialized_data
        #     head :ok
            # byebug
        # end

    end

    private

    def message_params

        params.require(:message).permit(:room_id, :user_id, :content)
    end

end
