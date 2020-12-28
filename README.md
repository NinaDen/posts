# README

# Docker

Docker container build on top of Evil Martians ideas: https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development

Suite includes:

* Rails 6.1
* Ruby 3.0.0-rc1
* PostgreSQL
* Sidekiq + Redis
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

# Mail settings

```cp .env.example .env```
and fill .env file with your smtp settings