# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Shopingcart_session',
  :secret      => '96121875bbe559c49c9054ff69bbd9cc743f27b63bb000f097f518c14ac879168fc510dbe373b75944b59b645f402b989c162dcc37c0d1de5dd503bd893c8153'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
