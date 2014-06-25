class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :cleanliness, :noise_tolerance, :visitors, :pets, :smoking, :sleeping_hours, :cooks, :lifestyle, :interests, :notes, :user_id
  has_one :user, serializer: UserShortSerializer
end
