class Public::SpacesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @q = Space.ransack(params[:q])
    if params[:keyword]
      @spaces = Space.search(params[:keyword]).where(is_active: true).page(params[:page]).per(10)
    else
      @spaces = @q.result(distinct: true).where(is_active: true).page(params[:page]).per(10)
    end
  end

  def show
    @space = Space.find(params[:id])
    @reviews = @space.reviews
  end

end
