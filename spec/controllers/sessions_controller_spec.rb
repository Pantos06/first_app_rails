require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

	render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  it "devrait avoir le bon titre" do
  	get :new
  	expect(response).to have_selector("tire", :content => "S'identifier")
end
