class CreatePost
  def initialize(current_user, permitted_params)
    @user = current_user
    @post_params = permitted_params
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    if create_post
      create_history_item
      notify_user
    end
    post
  end

  protected

  def create_post
    @post = Post.new(post_params.merge(user: user))
    post.save
  end

  def create_history_item
    history_item_params = {
      user: user,
      target_type: "Post",
      target_id: post.id,
      history_type: 'create'
    }
    HistoryItem.create(history_item_params)
  end

  def notify_user
    CreatePostMailer.create_post_mail(post).deliver_now
  end

  private

  attr_reader :user, :post_params, :post
end
