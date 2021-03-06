class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:edit, :update]

    def index 
        if check_restaurant
            @reviews = @restaurant.reviews
        elsif check_user
            @reviews = current_user.reviews
            @user = current_user
        else
            @reviews = Review.all 
        end

    end
    def new
        if check_restaurant
            @review = @restaurant.reviews.build
        else
            @review = Review.new
        end
    end
    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to restaurant_reviews_path(current_user)
            
        else
            render :new
        end
    end
    def edit
    end
    

    def update 
        if @review.update(review_params)
            redirect_to user_reviews_path(current_user)
        else
            render :edit
        end
    end

    def destroy
        set_review
        @review.delete
        redirect_to user_reviews_path(current_user)
    end

    def newest_reviews
        
        @reviews = Review.newest_reviews
        
    end
    
    private 

    def review_params
        #has to have specific attr listed in schema 
        params.require(:review).permit(:content, :restaurant_id, :user_id)
    end

    def set_review
        #finds review by id if user is logged in
        @review = Review.find_by_id(params[:id])
        redirect_to reviews_path if !@review || @review.user != current_user
    end

    def check_user
        #takes input from dynamic view in url
        params[:user_id] && @user = User.find_by_id(params[:user_id])
    end

    def check_restaurant
        #takes input from dynamic view in url
        params[:restaurant_id] && @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    end


end