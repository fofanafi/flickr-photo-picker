class SessionsController < ApplicationController
  def new
		frob = flickr.auth.getFrob
		@auth_url = FlickRaw.auth_url :frob => frob, :perms => 'read'
  end

	def signed_in
		frob = params[:frob]
		begin
			auth = flickr.auth.getToken :frob => frob
			session[:flickr_token] = auth.token
			@current_token = auth.token
			render :text => "You are now logged in as #{auth.user.username}."
		rescue FlickRaw::FailedResponse => e
			render :text => "Authentication failed : #{e.msg}"
		end
	end

	def destroy
		session[:flickr_token] = nil
	end

	def current_token
		@current_token ||= session[:flickr_token]
	end

end
