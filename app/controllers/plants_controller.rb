class PlantsController < ApplicationController

  def index
    @plant = Plant.new
    @plants = Plant.all
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path
    else
      render :index
    end
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :size)
  end
end