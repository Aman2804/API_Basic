class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title#, :comment_ids
  has_many :comments, exclude: :body
  # embed :ids, include: true

  # def comment_ids
  #   Comment.all.ids
  # end

end
