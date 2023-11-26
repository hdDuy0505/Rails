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
class Comment < ApplicationRecord
  validates :comment, presence: true
  validates :book_id, presence: true
  validates :owner_id, presence: true

  belongs_to :book, class_name: 'Book', foreign_key: 'book_id'
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
end
