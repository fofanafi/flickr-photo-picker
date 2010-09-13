# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flickr-photo-picker2_session',
  :secret      => '0beb5c730a62911d974ba2a181a82e1cbbad041e2f474b334adf9113fde441cc15dea1b840aee1e613d6a7da410c12aee4b3a074154878a829ed85cbc46c9b09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
