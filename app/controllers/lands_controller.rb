class LandsController < ApplicationController

  def index
    @lands = policy_scope(Land)
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
      redirect_to lands_path
    else
      render :new
    end
  end


  private

  def land_params
    params.require(:land).permit(:title,:description, :address, :price, :surface, :photo)
  end


end
