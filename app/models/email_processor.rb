class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Rails.logger.info @email.attachments.inspect
    post = Post.create!({ caption: @email.subject, image: @email.attachments.first })
    Pusher.trigger('posts', 'new_photo', PostSerializer.new(post).as_json)
  end
end
