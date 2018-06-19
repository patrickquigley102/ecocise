require 'rails_helper'

RSpec.describe "test_results/show", type: :view do
  before(:each) do
    @test_result = assign(:test_result, TestResult.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
