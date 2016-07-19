require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:tutorial) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:rating) }

  end

  describe "Users can't review the same tutorial more than once" do
    let (:user) {User.create(email: 'testman@testing.com', password: 'testtest') }
    let (:tutorial) {Tutorial.create(description: 'React tutorial for beginners', link: "www.google.com")}
  end

end
