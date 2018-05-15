class LandsController < ApplicationController

  def index
    @lands = Land.all
  end

  def show
    @land = Land.find(params[:id])
  end

  def new
    @land = Land.new
  end

  def create
    # raise
    @land = Land.new(land_params)
    @land.user_id = current_user.id
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
