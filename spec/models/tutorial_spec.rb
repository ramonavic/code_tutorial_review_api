require 'rails_helper'


Rspec.describe Tutorial, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to have_many(:ratings)}
  end
end
