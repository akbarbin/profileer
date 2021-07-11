require 'bcrypt'

class User < ApplicationRecord
  # users.password_hash in the database is a :string
  include BCrypt
  attr_reader :password_hash

  validates :email, presence: true,
                    uniqueness: true

  validates :name, presence: true
  validates :password, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end