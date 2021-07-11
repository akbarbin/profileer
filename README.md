# README
## Project Description
Profileer is web application that can validate phone number.

Things you may want to cover:

* Website
[https://profileer-app.herokuapp.com/](https://profileer-app.herokuapp.com/)

* Open API
[https://www.abstractapi.com/](https://www.abstractapi.com/)

* Ruby version
Ruby 3.0.2

* System dependencies
Rails 6.1.4

* Configuration
  .env file
  ```
  ABSTRACT_API_KEY=556bed4b995e42eca7114b937fd0b138
  HMAC_SECRET=my$ecretK3ys
  PORT=3000
  RACK_ENV=development
  ```

* Database creation
  ```ruby
  heroku run rake db:create
  heroku run rake db:migrate
  ```

* Database initialization
  ```ruby
  heroku run rake db:seed
  ```

* How to run the test suite
  ```ruby
  bundle exec rspec
  ```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
  ```bash
  git push heroku main
  ```

* Running app instructions
  ```bash
  heroku local
  ```

* Login as admin
  email: admin@profileer.com
  password: admin1234
