class SessionsController < ApplicationController
    def welcome
        
    end
###render login view
    def new
        render :login 
    end
###login to show page 
    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else
            redirect_to '/login'
        end
    end
###logout
    def destroy
        session.clear
        redirect_to '/'
    end

    def omniauth
        @user = User.find_or_create_by(username: auth["info"]["name"]) do |user|
            user.password = SecureRandom.hex(12)
        end
        if @user && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            redirect_to '/'
        end

    end

    private
    
    def auth 
        request.env['omniauth.auth']
    end


end
