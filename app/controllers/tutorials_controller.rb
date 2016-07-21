class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [ :show, :edit, :update, :destroy]
  respond_to :json

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      json { render :show, status: :created, location: @todo  }
    else
      format.json { render json: @tutorial.errors, status: :unprocessable_entity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :link)
    end
end
