Jungle
A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Setup
Run bundle install to install dependencies
Create config/database.yml by copying config/database.example.yml
Create config/secrets.yml by copying config/secrets.example.yml
Run bin/rake db:reset to create, load and seed db
SERVER_UP_COMMAND: bin/rails s -b 0.0.0.0
admin credentials: User: Jungle  pw: book
Create .env file based on .env.example
Sign up for a Stripe account
Put Stripe (test) keys into appropriate .env vars
Stripe Testing
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: https://stripe.com/docs/testing#cards

Dependencies
Rails 4.2 Rails Guide
PostgreSQL 9.x
Stripe
