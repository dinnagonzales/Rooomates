class Profile < ActiveRecord::Base
	# belongs_to :user
	has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },  :default_style => :display



  belongs_to :user
  has_many :favorabler_links, class_name: "Potential", foreign_key: :favorable_id, inverse_of: :favorablee
  has_many :favorablers, through: :favorabler_links, source: :user


  # Validate the attached image is image/jpg, image/png, etc
  	# validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


	has_many :potentials, :as => :favorable
end
