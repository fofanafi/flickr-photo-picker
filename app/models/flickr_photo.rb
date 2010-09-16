# == Schema Information
# Schema version: 20100913175202
#
# Table name: flickr_photos
#
#  id         :integer         not null, primary key
#  flickrid   :string(255)     not null
#  secret     :string(255)
#  urlsq      :string(255)
#  photopage  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class FlickrPhoto < ActiveRecord::Base
	attr_accessible :flickrid, :secret, :url_sq, :photopage

	def self.fromInfo(info)
		flickrid = info.id
		secret = info.secret
		url_sq = FlickRaw.url_s(info)
		photopage = FlickRaw.url_photopage(info)
		FlickrPhoto.new :flickrid => flickrid,
			:secret => secret,
			:url_sq => url_sq,
			:photopage => photopage
	end

	def self.fromID(id, secret = nil)
		self.fromInfo(flickr.photos.getInfo(:photo_id => id, :secret => secret))
	end

	protected

	def urlsqbyid(id, secret = nil)
		FlickRaw.url_s(getInfo id secret)
	end

	def photopagebyid(id, secret = nil)
		FlickRaw.url_photopage(getInfo id secret)
	end

	def getInfo(id, secret = nil)
		flickr.photos.getInfo(:photo_id => id, :secret => secret)
	end

end
