require 'rails_helper'


RSpec.describe Tutorial, type: :model do
  describe "validations" do
    it { is_expected.to belong_to(:user)}
    it { is_expected.to have_many(:reviews)}
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:description)}
    it { is_expected.to validate_presence_of(:user)}

  end
end
