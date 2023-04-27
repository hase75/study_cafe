class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to review_path
  end
  
  private

  def review_params
    params.require(:review).permit(:customer_id, :space_id, :rating, :comment)
  end
  
end
