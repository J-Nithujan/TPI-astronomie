# Version: 05.05.22
import os
import secrets

import urllib.parse

# Generate a random key for session
SECRET_KEY = secrets.token_hex()

# Had to be set to 'True' or 'False' to suppress error message due to future disabling
SQLALCHEMY_TRACK_MODIFICATIONS = True

username = 'postgres'

# Uncomment and give correct credentials for local use
# ------------
# Encode the password's character to avoid error with some characters, especially useful for '@'
password = urllib.parse.quote("Pa$$w0rd")
SQLALCHEMY_DATABASE_URI = f'postgresql://{username}:{password}@localhost:5432/db_astronomy'

# Database link for Heroku
# ------------
# Correct the url given by the heroku database server
# correct_db_uri = os.environ.get('DATABASE_URL').replace('postgres', 'postgresql')
# SQLALCHEMY_DATABASE_URI = correct_db_uri
