require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do
  let (:user) {User.create(email: "testwoman@testing.com", password: "testing123") }

  let (:valid_attributes) do
    {
      title: "How to get mad RSpec",
      description: "Follow these steps to be a testing ninja",
      link: "www.rspec.com",
      user: user
    }
  end

  let (:invalid_attributes) do
    {
      title: "",
      description: "",
      link: "",
      user: nil
    }
  end

  let!(:valid_tutorial) { Tutorial.create! valid_attributes }

  describe "GET #index" do
    it "is not accesible when not logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "assigns all tutorials to @tutorials" do
        get :index, format: :json

        expect(assigns(:tutorials)).to eq([valid_tutorial])
        expect(response).to be_success
        expect(response.content_type).to eq "application/json"

      end
    end
  end


  describe "GET #show" do
    it "is not accesible when not logged in" do
      get :show, {id: valid_tutorial.to_param}
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "assigns the requested tutorial as @tutorial" do
        get :show, {id: valid_tutorial.to_param}, format: :json
        expect(assigns(:tutorial)).to eq(valid_tutorial)
        expect(response).to be_success
      end
    end
  end

    describe "POST #create" do
      it "doesn't a user to post when not logged in" do
        post :create, {id: valid_tutorial.to_param}, format: :json
        expect(response).to redirect_to new_user_session_path
      end

    context "when logged in" do
      login_user

      it "creates the requested tutorial as @tutorial" do
        post :create,  {tutorial: {id: valid_tutorial.to_param, title: "titel", description: "description", link: "www.linkelinks.nl", user: user} }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq "application/json"

      end
    end
  end



end
