# File: user_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: Module with all the functions used to query the user table
# Version: 25.05.2022

from flask import flash
from sqlalchemy.exc import *

from app.model.forms import OutingRegistrationForm
from app.model.models import db, Users, Outings


def save_registration(form: OutingRegistrationForm, outing_id):
    """
    Adds the user to the database table corresponding and also adds an entry to the junction table `user_has_outing` or
    only updates the user's data if he/she already exists

    :param form: A form containing all the data for an entry of the table `user` in the database
    :param outing_id: id of the outing for which the user filled the registration form
    :return:
    """
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
        # This happens when there is no database
        flash('Base de données injoignable', 'Erreur')
    except ProgrammingError:
        # This occurs when the queried table does not exist
        flash('Structure de la base de données incomplète', 'Erreur')
    except Exception:
        # Catches all the unexpected exceptions
        flash('Erreur: Problème avec la base de données')