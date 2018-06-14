require 'rails_helper'

RSpec.describe 'Bikes application', type: :feature, js: true do
  before do
    # Tell Capybara to test an external application, the Bike application.
    Capybara.app_host = 'http://127.0.0.1:80'
  end

  describe 'visiting \the index page' do
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

      it 'lists all bike names' do
        bike_data['items'].each do |bike|
          expect(page).to have_css('div', text: bike['name'])
        end
      end

      it 'lists all bike descriptions' do
        bike_data['items'].each do |bike|
          expect(page).to have_css('div', text: bike['description'])
        end
      end

      it 'lists all bike classes' do
        bike_data['items'].each do |bike|
          expect(page).to have_css(
            'div',
            text: bike['class'].map(&:capitalize).join(', ')
          )
        end
      end

      context 'large window size' do
        before do
          # Using Bootstrap's container width cut off points
          page.driver.browser.manage.window.resize_to(993,1000)
        end
        # Serves thumbnails, although large image is available
        it 'lists all bike image thumbnails' do
          bike_data['items'].each do |bike|
            expect(page).to have_css("img[src*='#{bike['image']['thumb']}']")
          end
        end
      end

      context 'small window size' do
        before do
          # Using Bootstrap's container width cut off points
          page.driver.browser.manage.window.resize_to(575,1000)
        end
        it 'lists all bike image thumbnails' do
          bike_data['items'].each do |bike|
            expect(page).to have_css("img[src*='#{bike['image']['thumb']}']")
          end
        end
      end
    end
  end
end
