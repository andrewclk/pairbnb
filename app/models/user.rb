require 'byebug'
require 'carrierwave/orm/activerecord'

class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader
  has_many :listings
  has_many :reservations

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
 
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    user.password = "#{auth.name}123"
    user.email = auth.info.email
    user.remote_avatar_url = auth.info.image.gsub('http://','https://')
    user.save!
  end
end
end
