class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :image_id
end
