require 'cuba/test'

require './fizz_buzz_app.rb'

scope do
  test 'fizz_buzz.json returns valid json response' do
    post '/fizz_buzz.json?number=3'

    expected_response = {result: {input: 3, output: 'Fizz'}}.to_json

    assert_equal last_response.status, 200
    assert_equal last_response.body, expected_response
  end

  test 'fizz_buzz.json returns bad input messages' do
    post '/fizz_buzz.json?number=bad_input'

    expected_response = {errors:
      [{message: "invalid value for Integer(): \"bad_input\"", field: "number"}]
    }.to_json

    assert_equal last_response.status, 422
    assert_equal last_response.body, expected_response
  end

  test 'fizz_buzz.json returns no input error messages' do
    post '/fizz_buzz.json'

    expected_response = {errors:
      [{message: "invalid value for Integer(): \"\"", field: "number"}]
    }.to_json

    assert_equal last_response.status, 422
    assert_equal last_response.body, expected_response
  end
end