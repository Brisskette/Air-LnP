class BookingsController < ApplicationController
  def new
    @land = Land.find(params[:land_id])
    @booking = Booking.new
  end

  def create
    @land = Land.find(params[:land_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.land_id = params[:land_id].to_i
    if @booking.save
      redirect_to land_booking_path(@land, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end




end
