require 'rails_helper'

describe 'the user', type: :feature do
  include Capybara::DSL
  
  before(:each) do
    visit root_path
  end
  
  context 'visits the root path' do
    
    it 'renders the root page' do
      expect(page).to have_http_status(:ok)
      expect(page).to have_content("IdeaBox 2.0")
    end
    
    it 'displays the correct fields' do
      expect(page).to have_field("Title")
      expect(page).to have_field("Description")
      expect(page).to have_button("Save")
      expect(page).to have_field("Find Idea")
    end
  end
  
  context 'creates a new idea' do
    it 'when he/she clicks on save' do
      expect(Idea.all.count).to eq(0)
      
      fill_in "Title", with: "idea title"
      fill_in "Description", with: "idea description"
      click_on "Save"
      
      expect(Idea.all.count).to eq(1)
    end
  end
end
