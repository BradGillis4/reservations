class User < ApplicationRecord
    has_many :reviews
  
    has_many :restaurants, through: :reviews
    has_many :reservations, through: :restaurants
    has_secure_password 

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 
    validates :password, presence: true
end
