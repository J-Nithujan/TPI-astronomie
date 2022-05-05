# Version: 05.05.22

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Administrators(db.Model):
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    email: db.Column = db.Column(db.VARCHAR, nullable=False)
    password: db.Column = db.Column(db.VARCHAR, nullable=False)
