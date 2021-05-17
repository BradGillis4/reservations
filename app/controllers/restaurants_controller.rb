class RestaurantsController < ApplicationController
    # before_action :most_popular
    def new
        @restaurant = Restaurant.new
    end

    def create 
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new 
        end
    end

    def index 
        @restaurant = Restaurant.all
    end

    def popular_restaurants
       @restaurant = Restaurant.popular_restaurant
       
        end
    

    private 

    
    def restaurant_params 
        params.require(:restaurant).permit(:name)
    end
end
