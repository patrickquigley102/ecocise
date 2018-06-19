require 'rails_helper'

RSpec.describe 'Bikes application', type: :feature, js: true do
  before do
    # Tell Capybara to test an external application, the Bike application.
    Capybara.app_host = 'http://127.0.0.1:80'
  end

  describe 'visiting \the index page' do
    before { visit '/' }

    let(:bike_data_url) { 'http://localhost:80/bikes.json'}
    let(:bike_data) { JSON.load(open(bike_data_url)) }

    context 'when bike data exists' do
      let(:bike_count) { bike_data['items'].count }
      let(:index_item_count) { 7 }

      context 'when a class filter applied' do
        let(:bike_class) { bike_data['items'].first['class'].first.capitalize }

        before do
          # Select a filter based on the provided class data.
          find('div[ng-repeat=\'attr in attributesToFilter\']')
          .find(' span', text: bike_class)
          .sibling('input')
          .click
        end

        it 'displays only bicycles of that class and '\
        'maintains the filter on reload' do
          page.all('div.panel-footer').each do |desc|
            expect(desc.text).to include(bike_class)
          end

          visit '/'
          page.all('div.panel-footer').each do |desc|
            expect(desc.text).to include(bike_class)
          end
        end

        after do
          # Reset the filter selected previously.
          find('div[ng-repeat=\'attr in attributesToFilter\']')
          .find(' span', text: bike_class)
          .sibling('input')
          .click
        end
      end
    end
  end
end
