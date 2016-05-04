class FizzBuzz
  attr_accessor :number, :errors

  def initialize(number: nil)
    self.number = number
    self.errors = []
  end

  def result
    @parsed_result ||= parse!
  end

  def valid?
    @valid ||= valid_integer?
  end

  def input_integer
    @input_integer ||= Integer(number)
  end

  private

  def valid_integer?
    begin
      Integer(number) != nil
    rescue ArgumentError => e
      self.errors.push({message: e.message, field: 'number'})
      false
    end
  end

  def parse!
    case
      when multiple_of_three_and_five? then 'FizzBuzz'
      when multiple_of_five?           then 'Buzz'
      when multiple_of_three?          then 'Fizz'
      else                                  input_integer.to_s
    end
  end

  def multiple_of_three?
    input_integer % 3 == 0
  end

  def multiple_of_five?
    input_integer % 5 == 0
  end

  def multiple_of_three_and_five?
    multiple_of_three? && multiple_of_five?
  end

end