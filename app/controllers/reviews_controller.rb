class ReviewsController < ApplicationController
  respond_to :json

  def index
    @reviews = Review.all
  end



end
