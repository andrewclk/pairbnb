require 'byebug'

class User < ActiveRecord::Base
  include Clearance::User


	# def self.from_omniauth(auth)
 #    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
 #      user.provider = auth.provider
 #      user.uid = auth.uid
 #      user.name = auth.info.name
 #      user.oauth_token = auth.credentials.token
 #      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
 #      user.save!
 #    end
 #  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    byebug
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    user.email = auth.info.email
    user.save
  end
end
end

# class User < ActiveRecord::Base
  # include Clearance::User



#   include Clearance::User
 
#   has_many :authentications, :dependent => :destroy
  
#   def self.create_with_auth_and_hash(authentication,auth_hash)
#     create! do |u|
#       u.first_name = auth_hash["info"]["first_name"]
#       u.last_name = auth_hash["info"]["last_name"]
#       u.friendly_name = auth_hash["info"]["name"]
#       u.email = auth_hash["extra"]["raw_info"]["email"]
#       u.authentications<<(authentication)
#     end
#   end

  
#   def fb_token
#     x = self.authentications.where(:provider => :facebook).first
#     return x.token unless x.nil?
#   end
  
  
#   def password_optional?
#     true
#   end

# end