class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant

   
    validates :content, presence: true, length: {minimum: 3, maximum: 250} 
    
    #scope method
    def self.newest_reviews
        self.order("created_at DESC").limit(5)
      end
end
