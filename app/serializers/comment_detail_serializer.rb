# frozen_string_literal: true
class CommentDetailSerializer < ActiveModel::Serializer
  attributes :id, :comment
  belongs_to :owner, serializer: UserSerializer
end
