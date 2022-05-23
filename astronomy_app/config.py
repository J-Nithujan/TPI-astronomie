# Version: 05.05.22

import secrets

import urllib.parse

# Generate a random key for session
SECRET_KEY = secrets.token_hex()

# Had to be set to 'True' or 'False' to suppress error message due to future disabling
SQLALCHEMY_TRACK_MODIFICATIONS = True

username = 'postgres'
# Encode the password's character to avoid error with some characters, especially useful for '@'
password = urllib.parse.quote("P@$$w0rd")
SQLALCHEMY_DATABASE_URI = f'postgresql://{username}:{password}@localhost:5432/db_astronomy'
