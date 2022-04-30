# README

## To setup Mini Seedrs API without docker your local system needs you need to have

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

## To setup Mini Seedrs API with docker follow this
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

## **API Documentation**

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
        "percentage_raised": "0.0 %",
        "investment_multiple": "47.8",
        "image_url": "/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBPZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--3d2f4232ec85442745e284b109d86c8b8fb2a969/campaign_image_1"
      },

    ...

    ]
```


- Make an investment to a campaign
 ```bash
params: {
  *campaign_id* -> number, optional: since the given assignment specification was not clear I assumed investment name is the major key
  *campaign_name* -> string, required
  *amount* -> BigDecimal, required
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

## How would I modify the data model and API if I had to filter campaigns by different properties (e.g. Sector, Size, Number of Investor)


- To filter based on Country, Name, Sectors, Target amounts, Size-> I'd introduce filter scope attributes in my campaign API. Then based on the attribute from the request call I'd do queries separately in a queries helper. Additionally, I'd add a pg search gem and implement the search methodolog in my model to make searching better.

- Now, if there were large amount of data and filtering can be frequent by country or sectors, I'd create a separate table, say, address for these fields and create a many to many relation with the campaign model.

- To filter based on Number of investors -> To uniquely identify the actual number of investor, I'd add a user model and keep the investor data there. Running queries over User joins Investments joins Campaigns would sort out the thing we want.

