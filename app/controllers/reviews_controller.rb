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
    @review = Review.new(review_params)
    @review.user_id = current_user
    @review.tutorial_id = params[:review][:tutorial_id]
    @review.id = params[:review_id]

    if @review.save
      render json: @review, status: :created
    else
      render json: @review
    end
  end



  private

  def review_params
    params.require(:review).permit(:rating, :user, :tutorial_id)
  end


end
