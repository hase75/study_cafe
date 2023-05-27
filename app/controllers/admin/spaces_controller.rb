class Admin::SpacesController < ApplicationController
  
  def index
    @q = Space.ransack(params[:q])
    if params[:keyword]
      @spaces = Space.search(params[:keyword]).page(params[:page]).per(10)
    else
      @spaces = @q.result(distinct: true).page(params[:page]).per(10)
    end
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      flash[:notice] = "登録しました"
      redirect_to admin_spaces_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
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
    params.require(:space).permit(:name, :introduction, :genre_id, :address, :telephone_number, :transportation, :business_hours, :start_time, :end_time, :private_room, :smoking, :parking, :wifi, :outlet, :website, :is_active, :latitude, :longitude, image:[])
  end
  
end
