class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new
  end

  def new
    @reservation = Reservation.new

  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
       pay_item
       @reservation.save
       redirect_to root_path
    else
      render :new
    end
  end

  def standard
    @reservation = Reservation.new
  end

  def advanced
    @reservation = Reservation.new
  end

  private

  def reservation_params
    params.require(:reservation).permit(:children_name, :children_number_id, :allergy, :age_id, :nationality, :phone_number, :contact, :price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: reservation_params[:price], 
        card: reservation_params[:token],    
        currency: 'jpy'                
      )
  end
end
