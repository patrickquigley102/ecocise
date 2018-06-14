require 'rails_helper'

RSpec.describe 'visit bikes index', type: :feature, js: true do
  before do
    Capybara.app_host = 'http://127.0.0.1:80'
  end

  it 'visits the index' do
    visit '/'
    expect(page).to have_content 'Bikes'
  end
end
