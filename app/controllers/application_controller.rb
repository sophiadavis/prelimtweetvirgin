class ApplicationController < ActionController::Base
	protect_from_forgery

# these are all my attempts to get tweetvirgin.com to redirect to www.tweetvirgin.com
# eventually Jeff just went to GoDaddy and set tweetvirgin.com to redirect to www...
# is there a way to do this from inside the code?

=begin	
	# this was Joe's suggestion
	before_filter :ensure_domain
	
	def ensure_domain
		canonical_domain = 'www.tweetvirgin.com'
		#debugger
		#logger.info request.inspect
		if request.host != canonical_domain && ENV["RAILS_ENV"] == 'production'
			redirect_to request.protocol + canonical_domain + request.fullpath
		end
	end
I also tried the following instead of .fullpath:
	request_uri
	request_url
	request.fullpath
	
	before_filter :check_uri

	def check_uri
		redirect_to request.protocol + "www." + request.host_with_port + request.fullpath if !/^www/.match(request.host) if Rails.env =='production'
	end

	
	
	#redirect_to "http://www.tweetvirgin.com"

before_filter :force_www!
	
	protected
	
	def force_www!
		if Rails.env.production? and request.host[0..3] != “www.”
			redirect_to request.protocol + 'www.tweetvirgin.com' + request.fullpath, :status => 301
		end
	end



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


=end
end
