class Admin::ReviewsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_space_path(review.space.id)
  end
  
end
