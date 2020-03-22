class Api::V1::FriendshipsController < ApplicationController
    # skip_before_action :authorized, only: [:create, :index, :destroy]

    def index
        friendships = Friendship.all 
        render json: friendships
    end



    def create
        #is this bulk addition or individual addition?

        @friendship = Friendship.create(friendship_params)
        if @friendship.valid? #individual e.g. "Add friend" link
          # puts current_user_id
          # byebug
          @mutual = Friendship.create({ friendship: { user_id: @friendship.friend_id, friend_id: @friendship.user_id}})
          
          # @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
          
          render json: [@friendship, @mutual]
        else
          # params[:user][:friend_ids].each do |f_id|
          # @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, f_id)
          # end
        end
        # redirect_to users_path
      end

    def destroy
        Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
        # redirect_to(request.referer)
    end

    private
    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id)
    end


end
