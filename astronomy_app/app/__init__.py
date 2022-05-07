# Version 05.05.22

from .views import app
from .model.models import db

# register sqlalchemy to the application
db.init_app(app)
