class UserRoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :room_id
end
