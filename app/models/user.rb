class User < ApplicationRecord
    has_many :reviews
    
    has_many :restaurant_reviews, through: :reviews, source: :restaurant
    has_many :reservations
    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    
end
