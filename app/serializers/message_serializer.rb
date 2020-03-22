class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :room_id, :user_id
end
