require 'json'
require 'cuba'
require './fizz_buzz'
require './fizz_buzz_presenter'

INTERVIEWEE = 'Mario Olivio Flores'
THANKS_MESSAGE = 'Thanks for visiting. I hope you enjoyed this demonstration.'



Cuba.define do
  on post do
     on /fizz_buzz\.json\z/ do
      # NOTE: Cuba doesn't allow empty strings to be passed as default params.
      # We work around this by passing a proc to `on`. See this issue for more
      # details: https://github.com/soveran/cuba/issues/76
      fizz_buzz_response_handler = Proc.new{|number=''|
        fizz_buzz = FizzBuzz.new(number: number)
        response = FizzBuzzPresenter.new(fizz_buzz: fizz_buzz).as_json

        res.status = 422 if !fizz_buzz.valid?
        res.write(response)
      }

      on param('number'), &fizz_buzz_response_handler
      on true, &fizz_buzz_response_handler
    end
  end
  on get do
    on root do
      res.write "Welcome to Mario's FizzBuzz. #{THANKS_MESSAGE}\n\n - #{INTERVIEWEE}"
    end
    on /.+/ do
      res.redirect '/'
    end
  end
end


