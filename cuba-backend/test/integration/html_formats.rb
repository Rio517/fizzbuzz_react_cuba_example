require 'cuba/test'

require './fizz_buzz_app.rb'

scope do
  test 'root' do
    get '/'
    assert last_response.body.include?('Welcome to Mario\'s FizzBuzz')
  end

  test 'any page should redirect to root' do
    get '/any-page'
    follow_redirect!
    assert last_response.body.include?('Welcome to Mario\'s FizzBuzz')
  end
end