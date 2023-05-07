class Public::ReviewsController < ApplicationController
  
  def index
  end
  
  def review_params
    params.require(:review).permit(:comment, :all_rating, :rating1, :rating2, :rating3, :rating4).merge(
      customer_id: current_customer.id, space_id: params[:space_id]
    )
 
  end
end



