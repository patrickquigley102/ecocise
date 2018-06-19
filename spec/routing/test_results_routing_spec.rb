require "rails_helper"

RSpec.describe TestResultsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/test_results").to route_to("test_results#index")
    end

    it "routes to #show" do
      expect(:get => "/test_results/1").to route_to("test_results#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/test_results").to route_to("test_results#create")
    end
  end
end
