require 'cuba/test'
require './fizz_buzz'

test "FizzBuzz `input_integer` returns number inputed at instantiation" do
  assert_equal 1, FizzBuzz.new(number: 1).input_integer
end
test "FizzBuzz `input_integer` returns string as integer" do
  assert_equal 1, FizzBuzz.new(number: '1').input_integer
end
