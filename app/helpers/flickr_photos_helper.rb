module FlickrPhotosHelper

	def render_flickr_sidebar_widget(photoarray, columns = 6)
    begin
      photos = photoarray.to_a.in_groups_of(columns)
      render :partial => 'sidebar_widget', :locals => { :photos => photos }
    #rescue Exception
      #render :partial => '/photos/unavailable'
    end
  end

	def interesting(per_page = 12)
		list = flickr.interestingness.getList(:per_page => per_page, :extras => "url_sq")
		list.map do |info|
			FlickrPhoto.fromInfo(info)
		end
	end

	def auth_api_key
		FlickRaw.api_key = "c0e95b31a8dbfe4e84c12cdd29e1c539"
		FlickRaw.shared_secret = "3116bfe51a557129"
	end

end
