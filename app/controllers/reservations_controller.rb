class ReservationsController < ApplicationController
   
        before_action :redirect_if_not_logged_in
    
        def new 
            @reservation = Reservation.new
        end
    
        def create
            @reservation = Reservation.new(reservations_params)
            if @reservation.save
                redirect_to reservations_path
            else
                render :new
            end
        end
    
        def index
            @reservations = Reservation.all
        end
    
        def show 
            @reservations = Reservation.find_by_id(params[:id])
            redirect_to reservations_path if !@areservation
        end
    
    
        private 
    
        def reservations_params
            params.require(:reservation).permit(:datetime, :user_id, :restaurant_id)
        end
    
    end

