class UserSerializer < ActiveModel::Serializer
  attributes :id, :avatar, :profile
  has_many :favorables
end