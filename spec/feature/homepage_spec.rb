require 'rails_helper'

describe 'the user', type: :feature, js: true do
  include Capybara::DSL
  
  before(:each) do
    visit root_path
  end
  
  context 'visits the root path' do
    
    it 'renders the root page' do
      expect(page).to have_content("IdeaBox 2.0")
      expect(page).to have_field("Enter Title")
      expect(page).to have_field("Enter Description")
      expect(page).to have_button("Save")
      expect(page).to have_field("Find Idea")
    end
  end
  
  context 'creates a new idea' do
    xit 'when he/she clicks on save' do
      idea_count = Idea.count
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"
      
      expect(Idea.count).to eq(idea_count + 1)
    end
  end
  
  context 'deletes an idea' do
    xit 'when he/she clicks on delete' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"
      idea_count = Idea.count
      
      click_on "Delete"
      
      expect(Idea.count).to eq(idea_count - 1)
    end
  end
  
  context 'edits an idea' do
    it 'when he/she clicks on edit' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"

      expect(page).to have_content("idea title")
      
      first("#idea-edit").click
      fill_in "idea title", with: "idea title!"
      click_on "Save"
      
      expect(page).to have_content("idea title!")
    end
  end
  
  context 'thumbs-ups an idea' do
    it 'updates the quality accordingly' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"

      expect(page).to have_content("swill")
      
      first("#thumbs-up").click
      
      expect(page).to have_content("plausible")
    end
    
    it 'wont increment higher than genius' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"

      expect(page).to have_content("swill")

      first("#thumbs-up").click

      expect(page).to have_content("plausible")

      first("#thumbs-up").click
      
      expect(page).to have_content("genius")

      first("#thumbs-up").click
      
      expect(page).to have_content("genius")
    end
  end
  
  context 'thumbs-down an idea' do
    it 'updates the quality accordingly' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"

      expect(page).to have_content("swill")

      2.times do
        first("#thumbs-up").click
      end
      
      expect(page).to have_content("genius")
      
      first("#thumbs-down").click
      
      expect(page).to have_content("plausible")
    end
    
    it 'wont increment lower than swill' do
      fill_in "Enter Title", with: "idea title"
      fill_in "Enter Description", with: "idea description"
      click_on "Save"

      expect(page).to have_content("swill")
      
      first("#thumbs-down").click
      
      expect(page).to have_content("swill")
    end
  end
end
