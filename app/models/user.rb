require "bcrypt"

class User < ActiveRecord::Base
 include BCrypt
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :name, 
        :age,
        :gender,
        :city,
        :state, 
        :password_digest
        
  # has_one :profile
  # has_many :potentials
  has_one :profile
  has_many :favorable_links, class_name: "Potential", foreign_key: :user_id, inverse_of: :user
  has_many :favorables, through: :favorable_links, class_name: "Profile", foreign_key: :favorable_id
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_style => :display

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  acts_as_messageable


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


def favorable(opts={})
  # favorable_type
  type = opts[:type] ? opts[:type] : :topic
  type = type.to_s.capitalize
  # add favorable_id to condition if id is provided
  con = ["user_id = ? AND favorable_type = ?", self.id, type]
  
  # append favorable id to the query if an :id is passed as an option into the
  # function, and then append that id as a string to the "con" Array
  if opts[:id]
    con[0] += " AND favorable_id = ?"
    con << opts[:id].to_s
  end
 
  # Return all Favorite objects matching the above conditions
  favs = Favorite.all(:conditions => con)
  
  case opts[:delve]
  when nil, false, :false
    return favs
  when true, :true
    # get a list of all favorited object ids
    fav_ids = favs.collect{|f| f.favorable_id.to_s}

    if fav_ids.size > 0
      # turn the Capitalized favorable_type into an actual class Constant
      type_class = type.constantize

      # build a query that only selects
      query = []
      fav_ids.size.times do
        query << "id = ?"
      end
      type_conditions = [query.join(" AND ")] + fav_ids

      return type_class.all(:conditions => type_conditions)
    else
      return []
    end
  end       
end









end
