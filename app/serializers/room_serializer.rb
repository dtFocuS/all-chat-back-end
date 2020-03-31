class RoomSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer
  attributes :id, :name, :messages, :users
 
  # has_many :messages
  # has_many :users

  # include FastJsonapi::ObjectSerializer
  # attributes :name, :users, :messages
  # attribute :users do |room|
  #   UserSerializer.new(room.users.uniq)
  # end
end
