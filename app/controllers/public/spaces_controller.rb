class Public::SpacesController < ApplicationController
  
  def index
    @spaces = Space.all
    @reviews = Review.all
    @all_rating = '総合評価'
    @rating1 = '評価1'
    @rating2 = '評価2'
    @rating3 = '評価3'
    @rating4 = '評価4'
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
