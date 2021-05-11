class User < ApplicationRecord
    has_many :reviews
    
    has_many :reviewed_restaurants, through: :reviews, source: :restaurant
    has_many :reservations
    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    # validates :email, presence: true 
    # validates :password, presence: true
end
