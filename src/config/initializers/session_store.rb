# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oml_session',
  :secret      => 'c4972a450a8fd77a8028f9c1a611c6a07678e68fb42955a093ab1b5a937d2c76bdc233fd4608a15d8e216ff260b10e38401d7f7bcfdb2fae6f44ce7df5629099'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
