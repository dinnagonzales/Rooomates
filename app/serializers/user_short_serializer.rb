class UserShortSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url, :name, :age, :city
  
  def avatar_url
  	object.avatar.url(:square)
  end

end
