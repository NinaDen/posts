require 'rails_helper'

RSpec.describe HistoryItem, type: :model do
  let(:post) { create :post }
  let(:user) { create :user }

  context "with valid attributes" do
    it "is valid" do
      history_item = described_class.new(user: post.user, target: post, history_type: "create")
      expect(history_item).to be_valid
    end
  end

  context "without a user" do
    it "is not valid" do
      history_item = described_class.new(target: post, history_type: "create")
      expect(history_item).to_not be_valid
    end
  end

  context "without a history type" do
    it "is not valid" do
      history_item = described_class.new(user: post.user, target: post)
      expect(history_item).to_not be_valid
    end
  end

  context "without a target" do
    it "is not valid" do
      history_item = described_class.new(user: user, history_type: "create")
      expect(history_item).to_not be_valid
    end
  end
end
