class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
