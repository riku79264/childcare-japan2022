class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:new, :standard, :advanced]

  def index
    
  end

  def calender
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")

    message = Reservation.check_reservation_day(@day.to_date)
    if !!message
      redirect_to @reservation, flash: { alert: message }
    end
  end

  def standard
   
  end

  def advanced
   
  end

  def create
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    # @reservation.price = reservation_params[:price]
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

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:children_name, :children_number_id, :allergy, :age_id, :nationality, :phone_number, :contact, :price, :day, :time, :start_time).merge(user_id: current_user.id, token: params[:token])
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


# else
#   if reservation_params[:price] < 13000
#     render :new
#   else
#     if reservation_params[:price] < 20000
#       render :standard
#     else
#       render :advanced
#     end
#   end  
# end

 
# elsif reservation_params[:price] >= 30000  then
#   render :advanced
# elsif reservation_params[:price] >= 20000 then
#   render :standard
# else eservation_params[:price] >= 13000 
#   render :new
# end  

# elsif reservation_params[:price] = 13000 then
#   render :new
# elsif reservation_params[:price] = 20000 then
#   render :standard
# else reservation_params[:price] = 30000 
#   render :advanced
# end  