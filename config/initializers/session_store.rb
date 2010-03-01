# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dailytasks_session',
  :secret      => '0da630ea570a2e26cd67a9d4e131904dc48a04a419dd2c2cfac03d05386233ca7776ac1ee9e3c87f2dc7bf7b956dc7af6f525310749db27c48fb24ef4e04ea88'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
