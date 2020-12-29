require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create :post }
  let(:user) { create :user }
  let(:params_without_user) { { title: nil, user: user } }
  let(:params_without_title) { { title: 'title' } }

  context "with valid attributes" do
    it "is valid" do
      expect(post).to be_valid
    end
  end

  context "without a user" do
    it "is not valid" do
      post = described_class.new(params_without_user)
      expect(post).to_not be_valid
    end
  end

  context "without a title" do
    it "is not valid" do
      post = described_class.new(params_without_title)
      expect(post).to_not be_valid
    end
  end
end
