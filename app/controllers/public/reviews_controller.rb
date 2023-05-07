class Public::ReviewsController < ApplicationController
  
  def index
  end
  
  def create
    @review = current_customer.reviews.build(review_params)
    @space = @review.space
    if @review.save
      flash[:notice] = "success"
      redirect_to @space
    else
      flash.now[:alert] = "failed"
      render 'public/spaces/show'
    end
  end
  
  def update
    @review = Review.find(params[:id])
    @space = @review.space
    if @review.update(review_params)
      flash[:notice] = "success"
      redirect_to @space
    else
      flash.now[:alert] = "failed"
      render 'public/spaces/show'
    end
  end
  
  def review_params
    params.require(:review).permit(:comment, :rating, :space_id)
  end
end



