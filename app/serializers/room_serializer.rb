class RoomSerializer < ActiveModel::Serializer
  attributes :id, :users, :messages
 
  # has_many :messages
  # has_many :users

  # include FastJsonapi::ObjectSerializer
  # attributes :name, :users, :messages
  # attribute :users do |room|
  #   UserSerializer.new(room.users.uniq)
  # end
end
