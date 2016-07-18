require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe "validation" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:reviews) }

  end
end
