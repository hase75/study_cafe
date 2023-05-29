class Public::ReviewsController < ApplicationController

  before_action :authenticate_customer!

  def new
    @space_id = params[:space_id]
    review = Review.where(customer_id: current_customer.id, space_id: @space_id)
    if review.present?
      @review = review.first
    else
      @review = Review.new
    end
  end

  def create
    @review = current_customer.reviews.build(review_params)
    @space = @review.space
    if @review.save
      redirect_to @space, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      @reviews = @space.reviews
      render 'public/spaces/show'
    end
  end

  def update
    @review = Review.find(params[:id])
    @space = @review.space
    if @review.update(review_params)
      redirect_to @space, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      @reviews = @space.reviews
      render 'public/spaces/show'
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to space_path(review.space.id)
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rating, :space_id, :customer_id)
  end
end



