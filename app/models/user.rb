class User < ApplicationRecord
  has_secure_password
  has_many :comments
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true
  validates :lastname, presence: true
end
