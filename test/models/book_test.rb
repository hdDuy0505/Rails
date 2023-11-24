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
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
