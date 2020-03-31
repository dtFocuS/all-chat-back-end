class Api::V1::UserRoomsController < ApplicationController

    def index
        user_rooms = UserRoom.all
        render json: user_rooms
    end

    def create
        user_room = UserRoom.create(room_params)
        if user_room.valid?
            render json: { user_room: UserRoomSerializer.new(user_room) }, status: :created
        else
            render json: { error: 'failed to create' }, status: :not_acceptable
        end


    end

    def show
        user_room = UserRoom.find(params[:id])
        render json: { room: UserRoomSerializer.new(user_room) }
    end

    private

    def user_room_params
        params.require(:user_room).permit(:user_id, :room_id)
    end
end
