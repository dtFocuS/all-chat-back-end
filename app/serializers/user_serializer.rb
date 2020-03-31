class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :avatar, :rooms
  # include FastJsonapi::ObjectSerializer
  # attributes :id, :username
  # attribute :avatar_url do |user| 
  #   Rails.application.routes.url_helpers.rails_blob_path(user.avatar) if user.avatar.attached?
  # end
  # attribute :rooms do |user|
  #   user.rooms.uniq
  # end
end
