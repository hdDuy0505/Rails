# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  name            :string
#  age             :integer
#  password_digest :string           not null
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  access_token    :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
