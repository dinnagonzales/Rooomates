require "bcrypt"

class User < ActiveRecord::Base
 include BCrypt
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :name, 
        :gender,
        :city,
        :state, 
        :cleanliness,
        :noise_tolerance, 
        :visitors, 
        :pets, 
        :smoking, 
        :sleeping_hours, 
        :cooks, 
        :hours, 
        :lifestyle

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest=BCrypt::Password.create(new_password)
  
  end
  

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end

def forgot_password
  @user = User.find_by_email(params[:email])
  random_password = Array.new(10).map { (65 + rand(58)).chr }.join
  @user.password = random_password
  @user.save!
  Mailer.create_and_deliver_password_change(@user, random_password)
end

end
