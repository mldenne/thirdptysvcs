class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Rails.logger.info @email.attachments.inspect
    post = Post.create!({ caption: @email.subject, image_id: @email.attachment.first })
    Pusher.trigger('test_channel', 'my_event', PostSerializer.new(post).as_json)
  end
end
