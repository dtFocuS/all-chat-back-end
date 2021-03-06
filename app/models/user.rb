class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :messages
    has_many :user_rooms
    has_many :rooms, through: :user_rooms
    
    # has_one_attached :avatar
    # has_many :friendships, dependent: :destroy  
    # has_many :friends, through: :friendships
    # has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    # has_many :received_friends, through: :received_friendships, source: 'user'

    # def active_friends
    #     friends.select{ |friend| friend.friends.include?(self) }  
    # end

    # def pending_friends
    #     friends.select{ |friend| !friend.friends.include?(self) }  
    # end
end
