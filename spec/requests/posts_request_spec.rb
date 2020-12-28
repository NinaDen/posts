require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:each) do
    user = create :user
    login_as user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      10.times do
        create :post
      end
      get "/posts"
      expect(response).to render_template(:index)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get "/posts/new"
      expect(response).to render_template(:new)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'with valid params' do
      expect do
        post "/posts#create", params: { post: { title: "title" } }
      end.to change {
        Post.count
      }.from(0).to(1)
      expect(response).to redirect_to(action: :index)
    end

    it "without title" do
      expect do
        post "/posts#create", params: { post: { title: "" } }
      end.to_not(change do
        Post.count
      end)
      expect(response).to render_template(:new)
    end
  end
end
