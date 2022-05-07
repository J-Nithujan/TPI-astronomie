# Version: 05.05.22

import random
import string

# Generate a random key for session
SECRET_KEY = ''.join([random.choice(string.printable) for _ in range(24)])

# Had to be set to 'True' or 'False' to suppress error message due to future disabling
SQLALCHEMY_TRACK_MODIFICATIONS = True

SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:Pa$$w0rd@localhost:5432/db_astronomy'