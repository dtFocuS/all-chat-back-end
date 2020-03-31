class Api::V1::RoomsController < ApplicationController
    # skip_before_action :authorized

    def index
        rooms = Room.all
        render json: rooms
    end

    def create
        @room = Room.create(room_params)
        if @room.valid?
            render json: { room: RoomSerializer.new(@room) }, status: :created
        else
            render json: { error: 'failed to create room' }, status: :not_acceptable
        end


    end

    def show
        room = Room.find(params[:id])
        render json: { room: RoomSerializer.new(room) }
    end

    private

    def room_params
        params.require(:room).permit(:name, :user_id)
    end



    
end
