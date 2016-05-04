require './fizz_buzz_app'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '/fizz_buzz.json', :headers => :any, :methods => :get
  end
end

run Cuba