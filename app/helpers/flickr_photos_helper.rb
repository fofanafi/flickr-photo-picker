module FlickrPhotosHelper

	# type can be one of
	#		'viewer': just view the photos
	#		'picker': display a form for choosing photos
	def render_flickr_widget(photoarray, type, columns = 6)
    begin
      photos = photoarray.to_a.in_groups_of(columns)
      render :partial => type + '_widget', :locals => { :photos => photos }
    #rescue Exception
      #render :partial => '/photos/unavailable'
    end
  end
	
end
