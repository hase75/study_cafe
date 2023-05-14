class Admin::ReviewsController < ApplicationController
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_space_path(review.space.id)
  end
  
end
