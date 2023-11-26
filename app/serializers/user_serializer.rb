# frozen_string_literal: true
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :user, :age, :name

  def user
    "This is user: #{object.name}"
  end
end
