class Api::V1::RoomsController < ApplicationController
    skip_before_action :authorized

    def index
        rooms = Room.all
        render :json => rooms, status: :accepted
    end



    
end
