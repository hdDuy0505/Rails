# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id             :uuid             not null, primary key
#  title          :string           not null
#  author         :string           not null
#  description    :text             not null
#  price          :float            not null
#  published_date :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author
  has_many :comments, serializer: CommentSerializer
end
