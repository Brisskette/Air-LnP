class BookingsController < ApplicationController
  def new
    @land = Land.find(params[:land_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @land = Land.find(params[:land_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.land = @land
    # raise
    authorize @booking
    if @booking.save
      redirect_to land_booking_path(@land, @booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end




end
