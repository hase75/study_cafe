class Public::HomesController < ApplicationController
  
  def top
    @spaces = Space.order(average_rating: :desc).limit(4)
  end
  
end