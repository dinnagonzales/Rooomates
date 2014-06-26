class PotentialsSerializer < ActiveModel::Serializer
  attributes :favorable_id, :favorable_type, :user_id
  has_many :favorable


end

