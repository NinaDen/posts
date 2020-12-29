require 'rails_helper'
ActiveJob::Base.queue_adapter = :test

RSpec.describe CreatePost, type: :service do
  let(:user) { create :user }

  context "with valid attributes" do
    it "changes Post and HistoryItem counts, sends email" do
      puts described_class
      expect do
        described_class.call(user, { title: "title" })
      end.to change { Post.count }.from(0).to(1)
                                  .and change { HistoryItem.count }.from(0).to(1)
      expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq(1)
    end
  end

  context "with invalid attributes" do
    it "doesn't change Post and HistoryItem counts, doesn't send email" do
      user = create :user
      expect { described_class.call(user, { title: "" }) }.to not_change { Post.count }
        .and(not_change { HistoryItem.count })
        .and(not_change { ActionMailer::Base.deliveries.count })
        .and(not_change { ActiveJob::Base.queue_adapter.enqueued_jobs.size })
    end
  end
end
