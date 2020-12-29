require "rails_helper"

RSpec.describe CreatePostMailer, type: :mailer do
  let(:post) { create :post }
  let(:mail) { described_class.create_post_mail(post) }
  it "renders the headers" do
    expect(mail.subject).to eq("Create post mail")
    expect(mail.to).to eq([post.user.email])
    expect(mail.from).to eq(["from@example.com"])
  end
  it "renders the body" do
    expect(mail.body.encoded).to match(post.user.email)
    expect(mail.body.encoded).to match(post.id.to_s)
  end
end
