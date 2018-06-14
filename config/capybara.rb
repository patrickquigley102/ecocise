Capybara.configure do |config|
  # Set selenium as default driver
  config.default_driver = :selenium
  # max wait in seconds
  config.default_max_wait_time = 10
end
