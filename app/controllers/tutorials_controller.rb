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


  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.user = current_user

    if @tutorial.save
      render json: @tutorial, status: :created
    else
      render json: @tutorial
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    if @tutorial.update(tutorial_params)
      format.json { render :show, status: :ok, location: @tutorial }

    else
      format.json { render json: @tutorial.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
    format.json { head :no_content }
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :link, :user)
    end
end
