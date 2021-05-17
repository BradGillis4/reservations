class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :reservations

    validates :name, presence: true  

    def self.popular_restaurant
        total_restaurant_with_reviews = self.joins(:reviews).group('reviews.restaurant_id').having('reviews.id')
        @count_of_reviews = []

        total_restaurant_with_reviews.each do |restaurant|
            hash  = {reviewsCount: restaurant.reviews.count, name: restaurant.name}
            @count_of_reviews.push(hash)
        end
            #sort an array by the hash 
        @sort = @count_of_reviews.sort_by{|hsh|hsh[:reviewsCount]}.reverse
            
    return @sort[0][:name]
        # order('reviews')
        # having('count(reviews.id)')

        # count reviews
        # sort them by the count
        # return just the first one
    end


end
