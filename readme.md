# Mario's FizzBuzz Example w/ React

This is an (admittedly contrived) example FizzBuzz implementation using:

* [React](https://facebook.github.io/react/) (UDM versions to minimize dependencies)
* [Cuba](https://github.com/soveran/cuba) (Ruby micro framework)

The backend and frontend are independent, and both need to be run behind HTTP for CORS to work.

## Running

You can run both apps by:

* Cuba - standard app start, `rackup cuba-backend/config.ru`
* reach-frontend - you can install `http-server`
  1 `npm install -g http-server`
  2 `http-server react-frontend`
