require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with valid attributes" do
    post = create :post
    expect(post).to be_valid
  end
  it "is not valid without a user" do
    post = Post.new(title: 'title')
    expect(post).to_not be_valid
  end
  it "is not valid without a title" do
    user = create :user
    post = Post.new(title: nil, user: user)
    expect(post).to_not be_valid
  end
end
