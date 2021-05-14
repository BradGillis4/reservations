class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :datetime, presence: true
    
end
