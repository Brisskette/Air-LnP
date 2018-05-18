class LandsController < ApplicationController

  def index

    if params[:query].present?
      @lands = policy_scope(Land.search_by_title_and_address(params[:query]))
      # @lands_geo = Land.search_by_title_and_address(params[:query]).where.not(latitude: nil, longitude: nil)
      @lands_geo = @lands.where.not(latitude: nil, longitude: nil)
    else
      @lands = policy_scope(Land)
    # raise
    @lands_geo = Land.where.not(latitude: nil, longitude: nil)
    end

    @markers = @lands_geo.map do |land|
     {
       lat: land.latitude,
       lng: land.longitude,
       title: land.title,
       label: "#{land.price}€",
       id: land.id,
       #,
       # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
     }
    end
  end






   def show
    @land = Land.find(params[:id])
    authorize @land
    # @land_geo = @land.where.not(latitude: nil, longitude: nil)
    @markers = [
     {
      lat: @land.latitude,
      lng: @land.longitude,
      title: @land.title,
      label: "#{@land.price}€",
             #,
             # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
     }]
     sum = 0
     @land.reviews.each do |review|
      sum = sum + review.rating
     end
     if @land.reviews.length > 0
      @moyenne = " Average rating: #{sum / (@land.reviews.length)}/5"
    else
      @moyenne = "Waiting for rating"
    end

  end

    def new
      @land = Land.new
      authorize @land
    end

    def create
    # raise
    @land = Land.new(land_params)
    @land.user = current_user
    authorize @land

    if @land.save
      redirect_to land_path(@land)
    else
      render :new
    end
  end

  def edit
    @land = Land.find(params[:id])
    authorize @land
  end

  def update
    # raise
    @land = Land.find(params[:id])
    authorize @land

    if @land.update(land_params)
      redirect_to land_path(@land)
    else
      render :new
    end


  end
  def destroy
    @land = Land.find(params[:id])
    authorize @land
    @land.destroy
    redirect_to lands_path
  end


  private

  def land_params
    params.require(:land).permit(:title, :description, :address, :price, :surface, :photo)
  end


end
