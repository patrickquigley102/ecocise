require 'rails_helper'

RSpec.describe 'Bikes application', type: :feature, js: true do
  include_context 'bikes'
  include_context 'bikes index'

  describe 'visiting \the index page' do
    context 'when bike data exists' do
      context 'when a class filter is applied' do
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

          # Refresh the page
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
