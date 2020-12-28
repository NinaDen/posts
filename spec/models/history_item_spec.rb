require 'rails_helper'

RSpec.describe HistoryItem, type: :model do
  it "is valid with valid attributes" do
    post = create :post
    history_item = HistoryItem.new(user: post.user, target: post, history_type: "create")
    expect(history_item).to be_valid
  end
  it "is not valid without a user" do
    user = create :user
    post = Post.create(user: user, title: 'title')
    history_item = HistoryItem.new(target: post, history_type: "create")
    expect(history_item).to_not be_valid
  end
  it "is not valid without a history type" do
    user = create :user
    post = Post.create(user: user, title: 'title')
    history_item = HistoryItem.new(user: user, target: post)
    expect(history_item).to_not be_valid
  end
  it "is not valid without a target" do
    user = create :user
    history_item = HistoryItem.new(user: user, history_type: "create")
    expect(history_item).to_not be_valid
  end
end
