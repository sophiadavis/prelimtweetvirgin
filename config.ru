# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

map 'tweetvirgin.com' do
  run Rack::Rewrite do
    r301 '', 'http://www.tweetvirgin.com'
  end
end

run Tweetvirgin1::Application


