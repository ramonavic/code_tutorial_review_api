require 'rails_helper'


RSpec.describe Tutorial, type: :model do

  describe "associations" do
    it { should belong_to(:user)}
    it { should have_many(:reviews)}
  end

  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:link)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:user)}
  end




end
