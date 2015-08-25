require 'rails_helper'

describe 'the user', type: :feature do
  include Capybara::DSL
  
  before(:each) do
    visit root_path
  end
  
  context 'visits the root path' do
    
    it 'renders the root page' do
      expect(page).to have_http_status(:ok)
      expect(page).to have_content("Welcome!")
    end
  end
end
