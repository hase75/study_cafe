class Public::HomesController < ApplicationController

  def top
    @spaces = Space.all.includes(:reviews).sort_by(&:average_rating).reverse.first(4)
  end

end