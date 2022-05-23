# File: user_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: 
# Version: 23.05.2022

from flask import flash
from sqlalchemy.exc import *

from app.model.models import db, Users


def save_registration(form, outing_id):
    user = db.session.query(Users).where(firstname=form.firstname.data, lastname=form.lastname.data, age=form.age.data).first()

