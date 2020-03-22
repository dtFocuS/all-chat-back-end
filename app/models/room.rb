class Room < ApplicationRecord
    has_many :messages
    belongs_to :user
    belongs_to :friend, class_name: 'User'
    # has_many :users, through: :messages
end
