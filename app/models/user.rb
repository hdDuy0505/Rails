# == Schema Information
#
# Table name: users
#
#  id           :uuid             not null, primary key
#  name         :string
#  age          :integer
#  password     :string           not null
#  email        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  access_token :string
#
class User < ApplicationRecord

  has_secure_password # auto hash password

  # presence: true => NotEmpty
  # uniqueness: true => unique
  validates :name, presence: true, uniqueness: true

  validates :access_token, presence: true

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, presence: true, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{6,})/, message: "Password must contain at least 6 characters, include: uppercase, lowercase, number and special case character" } # \A mean: ^

  has_many :comments, class_name: 'Comment', dependent: :destroy
end
