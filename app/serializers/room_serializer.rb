class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :friend_id, :messages
 
  # has_many :messages
  # has_many :users

  # include FastJsonapi::ObjectSerializer
  # attributes :name, :users, :messages
  # attribute :users do |room|
  #   UserSerializer.new(room.users.uniq)
  # end
end
