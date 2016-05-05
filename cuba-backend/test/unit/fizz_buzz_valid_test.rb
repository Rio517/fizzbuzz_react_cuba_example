require 'cuba/test'
require './fizz_buzz'

test '#valid?' do
  test "valid integer is valid?" do
    assert FizzBuzz.new(number: 1).valid?
  end
  test "string as integer is valid?" do
    assert FizzBuzz.new(number: '1').valid?
  end
  test "mixted string is not valid?" do
    assert !FizzBuzz.new(number: '1a').valid?
  end
end