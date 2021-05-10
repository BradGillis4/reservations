class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :restaurant

   
    validates :content, length: {maximum: 250} 
    
    def self.newest_reviews
        self.order("created_at DESC").limit(5)
      end
end
