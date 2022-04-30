# README

** To setup Mini Seedrs API without docker your local system needs you need to have **

* Ruby version
```bash
 ruby '2.6.8'
```

* Rails version
```bash
 gem 'rails', '~> 5.2.6'
```

* Database
```bash
 latest postgres
```

** To run the project

- Clone the repository

  ```bash
    https://github.com/tamal3472/mini-seedrs-api.git
  ```

- Run command

  ```bash
    gem install bundler 2.3.8
    bundle install
    rails db:create
    rails db:migrate
    rails db:seed
    rails s
  ```

** To setup Mini Seedrs API with docker follow this **
- Clone the repository

  ```bash
    https://github.com/tamal3472/mini-seedrs-api.git
  ```

- Run command

  ```bash
  docker-compose up --build
  docker-compose run web rails db:create
  docker-compose run web rails db:migrate
  docker-compose run web rails db:seed
  ```
Server is now up and running at: http://localhost:3000

**API Documentation**

:bangbang: | it is mandatory to include
 ```bash
 Accept-Version: v1
 ```
in your header for each api call
:---: | :---

- Test Api to check if the server is working

localhost:3000/api/ping
