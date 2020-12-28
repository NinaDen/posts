# README

# Docker

Docker container build on top of Evil Martians ideas: https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development

Suite includes:

* Rails 6.1
* Ruby 3.0.0-rc1
* PostgreSQL
* Sidekiq + Redis
# Mail settings

Before building containers do

```cp .env.example .env```

Fill .env file with your smtp settings (important!)
# Setup

```bash
docker-compose build
docker-compose run runner bundle install 
docker-compose run runner yarn install
docker-compose run runner bundle exec rake db:create db:migrate db:seed
docker-compose up -d
```
Then just open in web browser:

```http://localhost:3000```

# Testing
To run all rspec test do
```docker-compose run runner rspec```

Open ./coverage/index.html to see coverage results report (224 / 224 LOC (100.0%) covered)

# Sidekiq

Mails are sent through Sidekiq, the queue of jobs can be viewed on ```http://localhost:3000/sidekiq```
