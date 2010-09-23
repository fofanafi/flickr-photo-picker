class FlickrPhotosController < ApplicationController
	include FlickrPhotosHelper

  # GET /flickr_photos
  # GET /flickr_photos.xml
  def index
    @flickr_photos = FlickrPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flickr_photos }
    end
  end

  # GET /flickr_photos/new
  # GET /flickr_photos/new.xml
  def new
    @photos = interesting

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flickr_photo }
    end
  end

	# Updates 'new' page via AJAX
	def pick_by_username
		username = params[:username]
		begin
			photos = getUserPhotos(username, :per_page => 18)
			render_flickr_widget(photos, 'picker')
		rescue FlickRaw::FailedResponse => e
			render :text => "<p>User " + username + " not found.</p>",
				:layout => false
		end
	end

  # POST /flickr_photos
  # POST /flickr_photos.xml
  def create
    @flickr_photo = FlickrPhoto.fromID(params[:flickr_photo][:flickrid])

    respond_to do |format|
      if @flickr_photo.save
        format.html { redirect_to(flickr_photos_path, :notice => 'Photo successfully added.') }
        format.xml  { render :xml => @flickr_photo, :status => :created, :location => @flickr_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flickr_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

	# GET /flickr_photos/table
	def table
		@flickr_photos = FlickrPhoto.all
	end

  # GET /flickr_photos/1
  # GET /flickr_photos/1.xml
  def show
    @flickr_photo = FlickrPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flickr_photo }
    end
  end

  # GET /flickr_photos/1/edit
  def edit
    @flickr_photo = FlickrPhoto.find(params[:id])
  end

  # PUT /flickr_photos/1
  # PUT /flickr_photos/1.xml
  def update
    @flickr_photo = FlickrPhoto.find(params[:id])

    respond_to do |format|
      if @flickr_photo.update_attributes(params[:flickr_photo])
        format.html { redirect_to(@flickr_photo, :notice => 'FlickrPhoto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flickr_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flickr_photos/1
  # DELETE /flickr_photos/1.xml
  def destroy
    @flickr_photo = FlickrPhoto.find(params[:id])
    @flickr_photo.destroy

    respond_to do |format|
      format.html { redirect_to(flickr_photos_url) }
      format.xml  { head :ok }
    end
  end

protected

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
