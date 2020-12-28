require 'rails_helper'

RSpec.describe "HistoryItems", type: :request do
  before(:each) do
    user = create :user
    login_as user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get "/history_items"
      expect(response).to render_template(:index)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end
end
