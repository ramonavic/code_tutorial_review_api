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
    @review.tutorial_id = Tutorial.find(params[:tutorial_id])
    @review.user = current_user
    @review = Review.new(tutorial: tutorial, user: user)

    if @tutorial.save
      render json: @review, status: :created
    else
      render json: @review
    end
  end



  private

  def review_params
    params.require(:review).permit(:rating, :user, :tutorial)
  end


end
