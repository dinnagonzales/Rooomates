class Potential < ActiveRecord::Base
  before_save :associate_user
  belongs_to :favorable
  belongs_to :user
  validates_presence_of :user_id, :favorable_id, :favorable_type


protected
def associate_user
  unless self.user_id
    return self.user_id = session[:user_id] if session[:user_id]
    return false
  end
end

end