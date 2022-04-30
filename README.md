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

:bangbang:  It is mandatory to include
 ```bash
    Accept-Version: v1
 ```
in your request header for each and every api call.



- Test Api to check if the server is working
 ```bash
   GET localhost:3000/api/ping
```
The expected response will be
 ```bash
    { pong: <current date>}
```


- Retrieve Campaigns
 ```bash
  GET  localhost:3000/api/campaigns
```
The expected response will be
 ```bash
    [
      {
        "name": "Rhonda Sporer II",
        "target_amount": "77188.81",
        "country": "Iraq",
        "sector": "Movies & Industrial",
        "percentage_raised": "0.0",
        "investment_multiple": "47.8",
        "image_url": "/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3d2f4232ec85442745e284b109d86c8b8fb2a969/campaign_image_1"
      },

    ...

    ]
```


- Make an investment to a campaign
 ```bash
params: {
  *campaign_id* :grey_question: number, optional: since the given assignment specification was not clear I assumed investment name is the major key

  *campaign_name* :question: string, required
  *amount* :question: BigDecimal, required
}

  POST  localhost:3000/api/investments
```
The expected response will be
 ```bash
{
    "investment_amount": "50.0",
    "invested_campaign": {
        "campaign_name": "Karole Mayert",
        "campaign_id": 74
    }
}
```