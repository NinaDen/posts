class CreatePostMailer < ApplicationMailer
  def create_post_mail(post)
    @post = post
    mail from: 'from@example.com', to: @post.user.email
  end
end
