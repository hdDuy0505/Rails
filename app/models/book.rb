# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  content    :text             not null
#  name       :string           not null
#  author     :string           not null
#  publisher  :time             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
  validates :title, presence: true
end
