class AddUsersToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :user_id, :integer
    add_column :rooms, :friend_id, :integer
  end
end
