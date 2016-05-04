require 'rack/cors'
require_relative 'fizz_buzz_app'

use Rack::Cors do
  allow do
    origins '*'
    resource '/fizz_buzz.json', :headers => :any, :methods => :get
  end
end

run Cuba