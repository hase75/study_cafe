class Admin::SpacesController < ApplicationController
  
  def index
    @spaces = Space.all
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
    params.require(:space).permit(:name, :introduction, :genre_id, :address, :telephone_number, :station, :business_hours, :start_time, :end_time, :private_room, :smoking, :wifi, :outlet, :website, :is_active, :image)
  end
  
end
