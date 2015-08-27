require 'rails_helper'

describe IdeasController, type: :controller do
  context '#create' do
    xit 'creates a new idea' do
      post :create, format: :json, idea: { title: "idea title", body: "idea body" }
      
      expect(response).to have_http_status(201) 
      idea_response = JSON.parse(response.body)
      expect(idea_response["title"]).to eq("idea title")
      expect(idea_response["body"]).to eq("idea body")
      expect(idea_response["quality"]).to eq("swill")
    end
  end
end
