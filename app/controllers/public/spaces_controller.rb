class Public::SpacesController < ApplicationController
  
  def index
    @spaces = Space.search(params[:keyword])
  end

  def show
    @space = Space.find(params[:id])
    @reviews = @space.reviews
    #@review = current_customer.reviews.find_or_initialize_by(space_id: @space.id)
  end
  
  
  private

  def space_params
    params.require(:space).permit(:name, :introduction, :address, :telephone_number, :website, :is_active, :image)
  end
  
end
