class CurrentUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :authentication_token, :avatar, :dni, :district, :infraction, :isAdmin
end
