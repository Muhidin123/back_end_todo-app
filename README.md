# BACK END TODO APPLICATION

The stack is:
- Rails 6.0
- Postgres

Dependencies
- Ruby 3.0.0
- Bundler 2.2.3
- Postgres


# Running app locally

Install and start postgresql:

- On macOS, you can use pg_ctl -D /usr/local/var/postgres start
- (To stop postgres use pg_ctl -D /usr/local/var/postgres stop)

Install dependencies:
- bundle install


Setup the database:

- rails db:setup
- rails db:migrate

# Launch app

Start the server with:
- `rails server` or `rails s`

Then go to http://localhost:3000 to view JSON if any.
