class LandsController < ApplicationController

  def index
    @lands = policy_scope(Land)
    @lands_geo = Land.where.not(latitude: nil, longitude: nil)

       @markers = @lands_geo.map do |land|
         {
           lat: land.latitude,
           lng: land.longitude#,
           # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
         }
       end
  end

  def show
    @land = Land.find(params[:id])
    authorize @land

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
    @land.destroy
    authorize @land
    redirect_to lands_path
  end


  private

  def land_params
    params.require(:land).permit(:title, :description, :address, :price, :surface, :photo)
  end


end
