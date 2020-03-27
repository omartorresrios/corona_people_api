class CitizenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :avatar_url, :name, :dni, :district, :infraction
end
