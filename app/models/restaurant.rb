class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :reservations

    validates :name, presence: true  
     
    # validate :not_a_duplicate 

    # def not_a_duplicate
    #     # if there is already a shop with this name and address 
    #     restaurant = Restaurant.find_by(name: name) 
    #     if  !!restaurant && restaurant != self
    #       errors.add(:name, 'has already been added')
    #     end
    # end 
end
