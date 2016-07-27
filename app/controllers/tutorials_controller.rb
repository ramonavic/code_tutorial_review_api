class TutorialsController < ApplicationController

  respond_to :json

  def index
    @tutorials = Tutorial.all
    @reviews = Review.all
  end


  def show
    @tutorial = Tutorial.find(params[:id])
    render json: {tutorial: @tutorial}
  end


  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user

    if @tutorial.save
      render json: @tutorial, status: :created
    else
      render json: @tutorial
    end
  end


  def update
    if @tutorial.update(tutorial_params)
      format.json { render :show, status: :ok, location: @tutorial }

    else
      format.json { render json: @tutorial.errors, status: :unprocessable_entity }
    end
  end


  def destroy
    @tutorial.destroy
    format.json { head :no_content }
  end


  private

    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :link, :user)
    end
end
