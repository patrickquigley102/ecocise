require 'open3'

class TestSuite
  # Store all outcomes from command
  # Could, in later iteration be used to display execution errors as part of
  # TestResult.rspec_output
  attr_accessor :rspec_stdout, :rspec_stderr, :rspec_status

  def run
    execute_rspec_suite
    TestResult.create(rspec_output: rspec_stdout)
  end

  private

  def execute_rspec_suite
    # Execute rspec command, likely: `rspec spec/features/ --format html`
    @rspec_stdout, @rspec_stderr, @rspec_status =
      Open3.capture3("#{ENV.fetch('RSPEC_TEST_SUITE_COMMAND')}")
  end
end
