class CreateTestResults < ActiveRecord::Migration[5.2]
  def change
    create_table :test_results do |t|
      t.text :rspec_output
      t.text :jasmine_output

      t.timestamps
    end
  end
end
