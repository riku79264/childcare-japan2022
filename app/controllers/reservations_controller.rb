class ReservationsController < ApplicationController
 
  before_action :set_reservation, only: [:new, :standard, :advanced]
  before_action :authenticate_user! , only: [:new,:standard, :advanced]

  def index
    
  end

  def new
    @day = params[:start_date]
    @time = params[:time]
  end

  def standard
   
  end

  def advanced
   
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def create
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
       pay_item
       @reservation.save
       redirect_to reservation_path @reservation.id
    elsif reservation_params[:price] == "13000"
      render :new
    elsif reservation_params[:price] == "20000" 
      render :standard
    else reservation_params[:price] == "30000" 
      render :advanced
    end  
  end  

  private

  def reservation_params
    params.require(:reservation).permit(:children_name, :children_number_id, :allergy, :age_id, :nationality, :phone_number, :contact, :price, :start_date, :start_time, :time).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: reservation_params[:price], 
        card: reservation_params[:token],    
        currency: 'jpy'                
      )
  end

  def set_reservation
    @reservation = Reservation.new
  end
end


