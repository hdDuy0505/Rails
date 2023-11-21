# == Schema Information
#
# Table name: books
#
#  id         :uuid             not null, primary key
#  comment    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :uuid
#
require "test_helper"

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
