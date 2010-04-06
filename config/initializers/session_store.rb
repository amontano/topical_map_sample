# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kmaps_sample_session',
  :secret      => '6acc0e30990189dc6661fbe7193984c173b36bcdccd09cb083ae975f5f3fcd98113cc8539960ea9dd5c0511f7f749fc746201c0e20c689ebc53bdd094f68e75c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
