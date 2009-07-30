# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simplebunks_session',
  :secret      => '29f9e2b10b8aacbc1d862226e7d884df7dad3fe546f4b8964e19748ccff6bbb1819dc19a988eef17ccf1395ed43f91665a955003fbc47151dedfdb633d94cb28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
