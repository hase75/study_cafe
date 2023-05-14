class Public::SpacesController < ApplicationController

  def index
    @q = Space.ransack(params[:q])
    if params[:keyword]
      @spaces = Space.search(params[:keyword]).where(is_active: true)
    else
      @spaces = @q.result(distinct: true).where(is_active: true)
    end
  end

  def show
    @space = Space.find(params[:id])
    @reviews = @space.reviews
  end

end
