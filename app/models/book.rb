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
class Book < ApplicationRecord
  validates :title, presence: true
  validates :author , presence: true
  validates :description, presence: true
  validates :published_date, presence: true
  validates :price, presence: true

  has_many :comments, class_name: 'Comment', dependent: :destroy
  # Or: has_many :comments, dependent: :destroy
end
