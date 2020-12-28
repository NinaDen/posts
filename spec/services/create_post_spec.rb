require 'rails_helper'
RSpec::Matchers.define_negated_matcher :not_change, :change
ActiveJob::Base.queue_adapter = :test

RSpec.describe CreatePost, type: :service do
  it "with valid attributes changes Post and HistoryItem counts" do
    user = create :user
    expect { CreatePost.call(user, { title: "title" }) }.to change {
      Post.count
    }.from(0).to(1)
      .and change {
             HistoryItem.count
           }.from(0).to(1)
    expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq(1)
  end

  it "with invalid attributes doesn't change Post and HistoryItem counts" do
    user = create :user
    expect { CreatePost.call(user, { title: "" }) }.to not_change { Post.count }
      .and(not_change { HistoryItem.count })
      .and(not_change { ActionMailer::Base.deliveries.count })
      .and(not_change { ActiveJob::Base.queue_adapter.enqueued_jobs.size })
  end
end
