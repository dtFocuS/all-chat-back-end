class Api::V1::RoomsController < ApplicationController
    # skip_before_action :authorized

    def index
        rooms = Room.all
        render :json => rooms, status: :accepted
    end

    def create
        @room = Room.create(room_params)
        if @room.valid?
            render json: { room: RoomSerializer.new(@room) }, status: :created
        else
            render json: { error: 'failed to create room' }, status: :not_acceptable
        end


    end

    private

    def room_params
        params.require(:room).permit(:name)
    end



    
end
