class TutorialsController < ApplicationController

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



  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)
    if user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = user.id
    end
    if @tutorial.save
      render json: { tutorial: @tutorial, location: tutorial_url(@tutorial) }, status: :created # 201
    else
      render json: { errors: @tutorial.errors }, status: :unprocessable_entity # 422
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
      params.require(:tutorial).permit(:title, :description, :link)
    end
end
