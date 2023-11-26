# frozen_string_literal: true
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :owner

  belongs_to :owner, serializer: UserSerializer
end
