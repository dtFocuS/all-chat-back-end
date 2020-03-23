class RemoveFriendFromRooms < ActiveRecord::Migration[6.0]
  def change

    remove_column :rooms, :friend_id, :integer
  end
end
