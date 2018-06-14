require 'rails_helper'

RSpec.describe 'Bikes application', type: :feature, js: true do
  before do
    # Tell Capybara to test an external application, the Bike application.
    Capybara.app_host = 'http://127.0.0.1:80'
  end

  describe 'the index page' do
    before do
      visit '/'
    end

    let(:bike_data_url) { 'http://localhost:80/bikes.json'}
    let(:bike_data) { JSON.load(open(bike_data_url)) }

    context 'when bike data exists' do
      let(:bike_count) { bike_data['items'].count }
      let(:index_item_count) { 7 }

      it 'contains a grid of appropriate product count' do
        expect(page).to have_css('div.prod', count: index_item_count)
      end
    end
  end
end
