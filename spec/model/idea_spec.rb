require 'rails_helper'

describe 'an idea' do
  
  context 'upon creation' do
    
    let(:valid_params) { { title: "idea title", body: "idea body", quality: 0 } }
    
    it 'is valid' do
      idea = Idea.create(valid_params)
      expect(idea).to be_valid
    end
    
    it 'is invalid without a title' do
      idea = Idea.create(body: "idea body", quality: 0)
      expect(idea).not_to be_valid
    end
    
    it 'is invalid without a body' do
      idea = Idea.create(title: "idea title", quality: 0)
      expect(idea).not_to be_valid
    end
    
    it 'is valid even without a quality' do
      idea = Idea.create(title: "idea title", body: "idea body")
      expect(idea).to be_valid
    end
    
    it 'defaults to a quality of swill' do
      idea = Idea.create(title: "idea title", body: "idea body")
      expect(idea.quality).to eq("swill")
    end
  end
end
