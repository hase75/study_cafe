class Public::SpacesController < ApplicationController
  
  def index
    @spaces = Space.search(params[:keyword])
  end
  
  

  def show
    @space = Space.find(params[:id])
    @reviews = @space.reviews
    #@review = current_customer.reviews.find_or_initialize_by(space_id: @space.id)
  end

end
