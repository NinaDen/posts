require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:each) do
    user = create :user
    login_as user
  end

  let(:valid_params) { { title: "title" } }
  let(:invalid_params) { { title: "" } }

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
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
    context 'with valid params' do
      it "creates new post and responds with redirect to index" do
        expect do
          post "/posts#create", params: { post: valid_params }
        end.to change {
          Post.count
        }.from(0).to(1)
        expect(response).to redirect_to(action: :index)
      end
    end

    context "with invalid params" do
      it "doesn't create new post and respond with template :new" do
        expect do
          post "/posts#create", params: { post: invalid_params }
        end.to_not(change do
          Post.count
        end)
        expect(response).to render_template(:new)
      end
    end
  end
end
