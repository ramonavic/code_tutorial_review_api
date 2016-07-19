require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tutorial) }
  end

  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:rating) }

  end

  describe "Users can't review the same tutorial more than once" do
    let (:user) {User.create(email: 'testman@testing.com', password: 'testtest') }
    let (:tutorial) {Tutorial.create(title: "React 123", description: 'React tutorial for beginners', link: "www.google.com", user: user)}
    subject { Review.new(rating: 5, user: user)}
    it { should validate_uniqueness_of(:rating).scoped_to(:user_id)}

  end

end
