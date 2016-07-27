class ReviewsController < ApplicationController
  respond_to :json

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    render json: {review: @review}
  end

  def create
    @review.user = current_user
    @review.tutorial = Tutorial.find(params[:tutorial_id])
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created
    else
      render json: @review
    end
  end



  private

  def review_params
    params.permit(:review, :rating, :user, :tutorial)
  end


end
