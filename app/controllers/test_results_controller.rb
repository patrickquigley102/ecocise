require './lib/test_suite'

class TestResultsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /test_results
  # GET /test_results.json
  def index
    @test_results = TestResult.all
  end

  # GET /test_results/1
  # GET /test_results/1.json
  def show
    @test_result = TestResult.find(params[:id])
  end

  # POST /test_results
  # POST /test_results.json
  def create
    @test_result = TestSuite.new.run

    respond_to do |format|
      if @test_result.save
        format.html { redirect_to @test_result, notice: 'Test result was successfully created.' }
        format.json { render :show, status: :created, location: @test_result }
      else
        format.html { render :new }
        format.json { render json: @test_result.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_result_params
      params.fetch(:test_result, {})
    end
end
