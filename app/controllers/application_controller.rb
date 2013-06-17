class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :ensure_domain
	
	def ensure_domain
		canonical_domain = 'tweetvirgin.com'
		
		if request.host != canonical_domain && ENV["RAILS_ENV"] == 'production'
			redirect_to request.protocol + canonical_domain + request.request_uri
		end
	end
end
