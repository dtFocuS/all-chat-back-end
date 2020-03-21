class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :messages
    has_many :friendships, dependent: :destroy  
    has_many :friends, through: :friendships
end
