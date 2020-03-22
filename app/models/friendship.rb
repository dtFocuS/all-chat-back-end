class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"
    validates_presence_of :user_id, :friend_id
    validate :user_is_not_equal_friend
    validates_uniqueness_of :user_id, scope: [:friend_id]







    # def self.create_reciprocal_for_ids(user_id, friend_id)
    #     user_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)
    #     friend_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)
    #     [user_friendship, friend_friendship]
    # end

  

    def is_mutual
        self.friend.friends.include?(self.user)
    end

    private
    def user_is_not_equal_friend
        errors.add(:friend, "can't be the same as the user") if self.user == self.friend
    end

    # def self.destroy_reciprocal_for_ids(user_id, friend_id)
    #     friendship1 = Friendship.find_by(user_id: user_id, friend_id: friend_id)
    #     friendship2 = Friendship.find_by(user_id: friend_id, friend_id: user_id)
    #     friendship1.destroy
    #     friendship2.destroy
    # end
end
