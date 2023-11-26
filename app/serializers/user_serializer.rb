# frozen_string_literal: true

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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user, :age, :name

  def user
    "This is user: #{object.name}"
  end
end
