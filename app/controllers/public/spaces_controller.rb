class Public::SpacesController < ApplicationController
  
  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
    @review = Review.new
  end
  
  private

  def space_params
    params.require(:space).permit(:name, :introduction, :address, :telephone_number, :website, :is_active, :image)
  end
  
end
