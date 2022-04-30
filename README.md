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


