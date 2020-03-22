class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :friend_id
  # has_many :users
  has_many :messages
end
