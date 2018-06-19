require 'rails_helper'

RSpec.describe TestSuite do
  describe '#run' do
    let(:instance) { described_class.new }
    let(:rspec_output) { "test\n" }
    subject { instance.run }
    before do
      stub_const('ENV', ENV.to_hash.merge('RSPEC_TEST_SUITE_COMMAND' => 'echo test'))
    end

    it 'creates a TestResult with rspec output' do
      expect{subject}.to change{TestResult.count}.from(0).to(1)
      expect(subject.rspec_output).to eq(rspec_output)
    end

    it 'executes rspec command and stores the result' do
      subject
      expect(instance.rspec_stdout).to eq(rspec_output)
      expect(instance.rspec_stderr).to eq('')
      expect(instance.rspec_stdout).to_not be nil
    end
  end
end
