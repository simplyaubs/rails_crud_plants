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

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update_attributes!(plant_params)

    redirect_to plants_path(@plant)
  end

  def destroy
    @plant = Plant.find(params[:id]).delete

    redirect_to plants_path
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :size)
  end
end