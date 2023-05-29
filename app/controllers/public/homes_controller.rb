class Public::HomesController < ApplicationController
  
  before_action :authenticate_customer!

  def top
    @spaces = Space.all.includes(:reviews).sort_by(&:average_rating).reverse.first(8)
  end

end