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
end