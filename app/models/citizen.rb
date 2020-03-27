class Citizen < ApplicationRecord

  mount_base64_uploader :avatar, AvatarUploader

  NAME_REGEX = /\A[a-zA-Z0-9_-]{3,30}\z/
  DNI_REGEX = /\A[+-]?\d+\z/

  validates :name, presence: true, format: { with: NAME_REGEX }
  validates :dni, presence: true, uniqueness: { case_sensitive: false }, format: { with: DNI_REGEX }
  validates :district, presence: true
  validates :infraction, presence: true

end
