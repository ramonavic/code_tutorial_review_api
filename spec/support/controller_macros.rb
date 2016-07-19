module ControllerMacros
  def login_user
    let (:user) {User.create(email: 'testman@testing.com', password: 'testtest') }

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end
end
