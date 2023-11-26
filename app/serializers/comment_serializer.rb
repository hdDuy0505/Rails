# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id         :uuid             not null, primary key
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :uuid             not null
#  owner_id   :uuid             not null
#
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :owner

  belongs_to :owner, serializer: UserSerializer
end
