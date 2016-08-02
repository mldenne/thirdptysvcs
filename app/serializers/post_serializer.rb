class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image, :created_at

  def image
    Refile.attachment_url(object, :image)
  end

  def created_at
    Faker::Date.backward(365)
  end

end
