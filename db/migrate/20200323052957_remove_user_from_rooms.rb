class RemoveUserFromRooms < ActiveRecord::Migration[6.0]
  def change

    remove_column :rooms, :user_id, :integer
  end
end
