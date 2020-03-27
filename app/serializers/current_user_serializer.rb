class CurrentUserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :authentication_token, :avatar_url, :dni, :district, :infraction, :is_admin
end
