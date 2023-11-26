class BookDetailSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :a
  has_many :comments, serializer: CommentDetailSerializer

  def a
    "abcad"
  end
end
