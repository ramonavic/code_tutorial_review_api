require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let (:user) {User.create(email: "testwoman@testing.com", password: "abcd1234" )}
  let (:tutorial) {Tutorial.create(title: "How to get mad RSpec", description: "Follow these steps to be a testing genius", link: "www.rspec.com", user: user, id: 2313)}


  let (:valid_attributes) do
    {
      rating: 5,
      user: user,
      tutorial: tutorial
    }
  end

  let (:invalid_attributes) do
    {
      rating: 5,
      user: nil,
      tutorial: nil
    }
  end

  let(:valid_review) { Review.create! valid_attributes}

  describe "GET #index" do
    it "is not accessible when not logged in" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end

    context "when logged in" do
      login_user

      it "assigns all reviews to @reviews" do
        get :index, format: :json

        expect(assigns(:reviews)).to eq([valid_review])
        expect(response).to be_success
        expect(response.content_type).to eq "application/json"
      end
    end
  end

  describe "GET #show" do
    it "is not accesible when not logged in" do
      get :show, {id: valid_review.to_param}, format: :json
      expect(response).to redirect_to new_user_session_path
    end

  context "when logged in" do
    login_user

    it "assigns the requested review as @review" do
      get :show, {id: valid_review.to_param}, format: :json
      expect(response).to be_success
      expect(assigns(:review)).to eq(valid_review)
      end
    end
  end

  describe "POST #create" do
    it "doesn't allow a user to post when not logged in" do
      post :create, {id: valid_review.to_param}, format: :json
      expect(response).to redirect_to new_user_session_path
  end

    context "when logged in" do
      login_user

      it "posts the created review as @review" do

      post :create, {review: {id: valid_review.to_param}, format: :json}
      expect(response).to have_http_status(:created)
      expect(response.content_type).to eq "application/json"

      end
    end
  end



end
