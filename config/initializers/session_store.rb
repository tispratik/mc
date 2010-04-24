# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MC_session',
  :secret      => '7a50d4bc11bd869a61b844c38d695e535be117805d03cc685bda687a9764002ea00d285e76acfa8c4beed28fbd4436e878459d072b7e9c5632ade9584458e169'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
