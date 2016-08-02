class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image

  def image
    Refile.attachment_url(object, :image)
  end
end
