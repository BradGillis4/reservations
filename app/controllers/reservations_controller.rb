class ReservationsController < ApplicationController
   
        before_action :redirect_if_not_logged_in
    
        def new 
            @reservation = Reservation.new
        end
        def index # nested route / setting value to @post then evalauating if it's 'nill' or "something" / if true it will continue reading doce below
            @reservations = Reservation.where("user_id" => current_user.id)
        end
    
        def create
            @reservation = current_user.reservations.build(reservations_params)
            
            if @reservation.save
                
                redirect_to reservations_path
            else
                
                render :new
            end
        end
    
        
    
        def show 
            @reservations = Reservation.find_by_id(params[:id])
            redirect_to reservations_path if !@reservation
        end

        def destroy
            set_reservation
            @reservation.delete
            redirect_to new_reservation_path(current_user)
        end
    
        private 
        
        def set_reservation
            @reservation = Reservation.find_by_id(params[:id])
            redirect_to reservations_path if !@reservation || @reservation.user != current_user
        end

        def reservations_params
            params.require(:reservation).permit(:datetime, :user_id, :restaurant_id)
        end
    
    end

