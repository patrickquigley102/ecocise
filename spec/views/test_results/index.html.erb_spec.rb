require 'rails_helper'

RSpec.describe "test_results/index", type: :view do
  before(:each) do
    assign(:test_results, [
      TestResult.create!(),
      TestResult.create!()
    ])
  end

  it "renders a list of test_results" do
    render
  end
end
