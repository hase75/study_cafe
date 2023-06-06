class Admin::SpacesController < ApplicationController
  
  before_action :authenticate_admin!

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
      redirect_to admin_spaces_path, notice: "登録しました"
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
    @space = Space.find(params[:id])
    if @space.update(space_params)
      redirect_to admin_spaces_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :introduction, :genre_id, :address, :telephone_number, :transportation, :business_hours, :start_time, :end_time, :private_room, :smoking, :parking, :wifi, :outlet, :website, :is_active, :latitude, :longitude, images:[])
  end

end
