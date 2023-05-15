class Admin::SpacesController < ApplicationController
  
  def index
    @spaces = Space.search(params[:keyword])
  end

  def new
    @space = Space.new
  end

  def create
    space = Space.new(space_params)
    space.save
    redirect_to admin_spaces_path
  end

  def show
    @space = Space.find(params[:id])
    @reviews = @space.reviews
  end

  def edit
    @space = Space.find(params[:id])
  end
  
  def update
    space = Space.find(params[:id])
    space.update(space_params)
    redirect_to admin_spaces_path
  end
  
  private

  def space_params
    params.require(:space).permit(:name, :introduction, :genre_id, :address, :telephone_number, :transportation, :business_hours, :start_time, :end_time, :private_room, :smoking, :parking, :wifi, :outlet, :website, :is_active, :latitude, :longitude, :image)
  end
  
end
