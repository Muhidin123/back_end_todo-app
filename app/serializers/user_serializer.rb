class UserSerializer
  include FastJsonapi::ObjectSerializer
  has_many :notes

  attributes :id, :username, :email, :first_name
end
