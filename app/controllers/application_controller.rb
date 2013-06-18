class ApplicationController < ActionController::Base
	protect_from_forgery

before_filter :force_www!
	
	protected
	
	def force_www!
		if Rails.env.production? and request.host[0..3] != “www.”
		redirect_to “#{request.protocol}www.#{request.host_with_port}#{request.fullpath}”, :status => 301
		end
	end


=begin
	before_filter :ensure_domain

	APP_DOMAIN = 'www.tweetvirgin.com'

	def ensure_domain
		if request.env['HTTP_HOST'] != APP_DOMAIN
		  # HTTP 301 is a "permanent" redirect
		  redirect_to "http://#{APP_DOMAIN}#{request.env['REQUEST_PATH']}", :status => 301
		end
	end
	
	before_filter :ensure_domain
	
	def ensure_domain
	
		redirect_to request.protocol + "www." + request.host_with_port + request.request_uri if !/^www/.match(request.host) if Rails.env == 'production'
	
	end

	def ensure_domain
		canonical_domain = 'www.tweetvirgin.com'
		#debugger
		#logger.info request.inspect
		if request.host == 'tweetvirgin.com' && ENV["RAILS_ENV"] == 'production'
			redirect_to request.protocol + canonical_domain + request.fullpath
		end
	end
=end
end
# request_uri
# request_url
# request.fullpath


#</br> </br>
#<%= request.inspect %>
