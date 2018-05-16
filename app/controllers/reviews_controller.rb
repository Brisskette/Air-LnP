class ReviewsController < ApplicationController

 def new
    # we need @land in our `simple_form_for`
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @land = @booking.land
    # we need `booking_id` to asssociate review with corresponding booking
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to land_path(@land)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
