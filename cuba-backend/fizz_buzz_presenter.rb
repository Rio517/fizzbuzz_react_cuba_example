class FizzBuzzPresenter
  attr_accessor :fizz_buzz

  def initialize(fizz_buzz:)
    self.fizz_buzz = fizz_buzz
  end

  def as_json
    response.to_json
  end

  private

  def response
    if fizz_buzz.valid?
      valid_presentation
    else
      { errors: fizz_buzz.errors }
    end
  end

  def valid_presentation
    {
      result: {
        number: fizz_buzz.input_integer,
        result: fizz_buzz.result,
      },
      message: {
        body: THANKS_MESSAGE,
        author: INTERVIEWEE
      }
    }
  end
end