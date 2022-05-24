# File: user_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: 
# Version: 23.05.2022

from flask import flash
from sqlalchemy.exc import *

from app.model.forms import OutingRegistrationForm
from app.model.models import db, Users, Outings


def save_registration(form: OutingRegistrationForm, outing_id):
    try:
        user = db.session.query(Users).where(Users.firstname == form.firstname.data,
                                             Users.lastname == form.lastname.data, Users.age == form.age.data).first()
        
        selected_outing: Outings = db.session.query(Outings).where(Outings.id == outing_id).first()
        
        if user:
            # Add outing to the list of outing for which user has already registered
            user.outings.append(selected_outing)
        else:
            # Create a new user and make the junction with outing
            user = Users(firstname=form.firstname.data, lastname=form.lastname.data, age=form.age.data, email=form.email.data,
                         phone_number=form.phone_number.data)
            
            user.outings.append(selected_outing)
            db.session.add(user)
        
        selected_outing.remaining_slots -= 1
        db.session.commit()
    
    except OperationalError:
        flash('Base de données injoignable', 'Erreur')
    except ProgrammingError:
        flash('Structure de la base de données incomplète', 'Erreur')