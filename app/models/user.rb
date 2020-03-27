class User < ApplicationRecord
  has_secure_password

  mount_base64_uploader :avatar, AvatarUploader
  attr_accessor :avatar_data

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  NAME_REGEX = /\A[a-zA-Z0-9_-]{3,30}\z/
  DNI_REGEX = /\A[+-]?\d+\z/

  validates :name, presence: true # <------- poner NAME_REGEX here
  validates :dni, presence: true, uniqueness: true, format: { with: DNI_REGEX }
  validates :password, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  def authentication_token
    JsonWebToken.encode(user_id: id)
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end

end
