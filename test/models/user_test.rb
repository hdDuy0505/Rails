# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string
#  age        :integer
#  password   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
