# File: config.py
# Author: Nithujan Jegatheeswaran
# Brief: File with all the config variables of the application
# Version: 25.05.2022

import os
import secrets
import urllib.parse

# Generate a random key for session
SECRET_KEY = 'a96d38c6a85259d18810fd8ef42719e0f82ed410d1dca8557d0a1b4d4697de1b'
SESSION_COOKIE_SECURE = True

# Had to be set to 'True' or 'False' to suppress error message due to future disabling
SQLALCHEMY_TRACK_MODIFICATIONS = True

# Uncomment if commented and give correct credentials for local use
# ------------
# Encode the character to avoid error with some characters, especially useful for '@'
username = urllib.parse.quote('postgres')
password = urllib.parse.quote("P@$$w0rd")
SQLALCHEMY_DATABASE_URI = f'postgresql://{username}:{password}@localhost:5432/db_astronomy'

# Database link for Heroku, uncomment before deploying
# ------------
# Correct the url given by the heroku database server
# correct_db_uri = os.environ.get('DATABASE_URL').replace('postgres', 'postgresql')
# SQLALCHEMY_DATABASE_URI = correct_db_uri
