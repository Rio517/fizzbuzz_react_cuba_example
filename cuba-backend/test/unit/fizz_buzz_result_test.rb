require 'cuba/test'
require './fizz_buzz'

test "FizzBuzz `result` prints number for non-multiples of 3 and 5" do
  [1,7,11, 13].each do |num|
    assert_equal FizzBuzz.new(number: num).result, num.to_s
  end
end
test "FizzBuzz `result` prints 'Fizz' for multiples of 3" do
  [3,6,9].each do |num|
    assert_equal FizzBuzz.new(number: num).result, 'Fizz'
  end
end
test "FizzBuzz `result` prints 'Buzz' for multiples of 5" do
  [5,10,20].each do |num|
    assert_equal FizzBuzz.new(number: num).result, 'Buzz'
  end
end
test "FizzBuzz `result` prints 'FizzBuzz for multiples of 3 and 5" do
  [15,30,45].each do |num|
    assert_equal FizzBuzz.new(number: num).result, 'FizzBuzz'
  end
end
