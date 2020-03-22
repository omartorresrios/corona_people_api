class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  def authentication_token
    JsonWebToken.encode(user_id: id)
  end

  def self.authenticate(email_or_name, password)
    user = User.find_by(email: email_or_name)
    user && user.authenticate(password)
  end

  def self.authenticate_google(google_id)
    user = User.find_by(google_id: google_id)
    user && user.authenticate(google_id)
  end

  def avatar_url
    if facebook_login? && avatar.url.nil?
      "https://graph.facebook.com/#{facebook_id}/picture?type=large"
    else
      avatar.url
    end
  end
end
