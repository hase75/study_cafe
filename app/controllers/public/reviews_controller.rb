class Public::ReviewsController < ApplicationController

  def index
  end

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
      flash[:notice] = "登録しました"
      redirect_to @space
    else
      flash.now[:alert] = "登録に失敗しました"
      render 'public/spaces/show'
    end
  end

  def update
    @review = Review.find(params[:id])
    @space = @review.space
    if @review.update(review_params)
      flash[:notice] = "更新しました"
      redirect_to @space
    else
      flash.now[:alert] = "更新に失敗しました"
      render 'public/spaces/show'
    end
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :space_id)
  end
end



