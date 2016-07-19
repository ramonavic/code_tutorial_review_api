require 'rails_helper'


RSpec.describe TutorialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/").to route_to("tutorials#index")
    end

    it "routes to #show" do
      expect(:get => "/tutorials/1").to route_to("tutorials#show", id: "1")
    end

    it "routes to #create" do
      expect(:post => "/tutorials").to route_to("tutorials#create")
    end
  end
end
