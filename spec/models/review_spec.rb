require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tutorial) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:rating) }


end
