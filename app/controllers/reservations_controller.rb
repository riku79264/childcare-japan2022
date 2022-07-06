class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new
  end

  def new
    @reservation = Reservation.new

  end

  def create
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
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
    params.require(:reservation).permit(:children_name, :children_number_id, :allergy, :age_id, :nationality, :phone_number, :contact, :price).merge(user_id: current_user.id)
  end
end
