class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    Rails.logger.info @email.attachments.inspect
    post = Post.create!({ title: @email.subject, body: @email.body, from_email: @email.from[:email] })
    Pusher.trigger('test_channel', 'my_event', PostSerializer.new(post).as_json)
  end
end
