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
    @review = Review.find(review_params)

    @review.user = current_user

    @review = @tutorial.reviews.build(params[:tutorial])

    if @review.save
      render json: @review, status: :created
    else
      render json: @review
    end
  end



  private

  def review_params
    params.permit(:review, :rating, :user, :tutorial_)
  end

  protected

  def find_tutorial
    @tutorial = Tutorial.find(params[:tutorial_id])
  end

end
