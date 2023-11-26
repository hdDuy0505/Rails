# frozen_string_literal: true
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author
  has_many :comments, serializer: CommentSerializer
end
