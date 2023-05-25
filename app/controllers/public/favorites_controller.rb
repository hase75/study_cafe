class Public::FavoritesController < ApplicationController
  
  def index
    @favorites = Favorite.where(customer_id: current_customer.id)
  end
  
  def create
    @favorite = current_customer.favorites.create(space_id: params[:space_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @space = Space.find(params[:space_id])
    @favorite = current_customer.favorites.find_by(space_id: @space.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
