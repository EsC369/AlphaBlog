class User < ActiveRecord::Base
  has_many :articles
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  NORM_REGEX = /\A[a-zA-Z0-9\s]+\z/i
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: { case_sensitive: false}, format: { with: NORM_REGEX, message: "Can Only Contain Letters And Numbers!" }
  validates :email, presence: true, length: { minimum: 3, maximum: 100 }, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX, message: "Must Be A Valid Email!" }
end
