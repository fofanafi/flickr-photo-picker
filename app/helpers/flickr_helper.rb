module FlickrHelper

	# throws FlickRaw::FailedResponse when user not found
	def getUserPhotos(username, opts = {})
		defaults = {:per_page => 12}
		opts = defaults.merge opts
		user_id = flickr.people.findByUsername(:username => username).id
		infolist = flickr.people.getPublicPhotos :user_id => user_id,
			:per_page => opts[:per_page]
		photosFromInfo infolist
	end

	def interesting(per_page = 12)
		list = flickr.interestingness.getList(:per_page => per_page, :extras => "url_sq")
		photosFromInfo(list)
	end

	def photosFromInfo(infolist)
		infolist.map do |info|
			FlickrPhoto.fromInfo(info)
		end
	end
	
	def auth_api_key
		FlickRaw.api_key = "c0e95b31a8dbfe4e84c12cdd29e1c539"
		FlickRaw.shared_secret = "3116bfe51a557129"
	end

end
