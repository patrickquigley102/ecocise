shared_context 'bikes' do
  before do
    # Tell Capybara to test an external application, the Bike application.
    Capybara.app_host = 'http://127.0.0.1:80'
  end

  # Shared test data
  let(:bike_data_url) { 'http://localhost:80/bikes.json'}
  let(:bike_data) { JSON.load(open(bike_data_url)) }
  let(:bike_count) { bike_data['items'].count }
  let(:index_item_count) { 7 }
end
