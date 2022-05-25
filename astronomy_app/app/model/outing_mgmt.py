# File: outing_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: This module contains all the functions used by the website to query the outing table and the ones related to it
# Version: 25.05.2022

from datetime import datetime

from flask import flash
from sqlalchemy.exc import *
from sqlalchemy.sql import select

from app.model.forms import NewOutingForm
from app.model.models import db, Outings, CelestialObjects


def add_outing(form: NewOutingForm) -> bool:
    """
    Adds an outing to the database and the entries of the junction table `outing_has_celestial_object`

    :param form: A form containing all the data for an entry of the table outing`
    :return: True if the operation was successful, False otherwise
    """
    # Data conversion
    try:
        meeting_time: datetime = datetime.strptime(form.meeting_time.data, '%H:%M %d.%m.%Y')
        duration: datetime = datetime.strptime(form.duration.data, '%H:%M')

        outing = Outings(theme=form.theme.data, meeting_time=meeting_time, duration=duration,
                         place=form.place.data, equipment=form.equipments.data, max_people=form.max_people.data,
                         remaining_slots=form.max_people.data, comment=form.comment.data)

        # Adds the selected celestial_objects and the newly created outing to the junction
        # table outing_has_celestial_object
        for number in form.celestial_objects.data:
            celestial_object: CelestialObjects = CelestialObjects.query.filter_by(messier_number=number).first()
            celestial_object.outings.append(outing)

        db.session.add(outing)
        db.session.commit()
        return True

    except OperationalError:
        # This happens when there is no database
        form.errors.append('Erreur: la transaction avec la base de données a échouée')
        return False
    except ProgrammingError:
        # This occurs when the queried table does not exist
        form.errors.append('Erreur: la structure de la base de données est incomplète')
        return False
    except Exception:
        # Catches all the unexpected exceptions
        form.errors.errors.append('Erreur: problème avec la base de données')
        return False


def get_outing_list() -> list[Outings]:
    """
    Gets the complete list of all the existing outings

    :return: A list of Outings ordered by id
    """
    try:
        outing_list: list[Outings] = Outings.query.order_by(Outings.id).all()

        if len(outing_list) == 0:
            flash('Base de données vide', 'Erreur')
        else:
            for outing in outing_list:
                outing.meeting_time = outing.meeting_time.strftime('%d.%m.%Y %H:%M')
                outing.duration = outing.duration.strftime('%H:%M')
                # outing.equipment.replace('\r\n', '\'<br>\'')
                # outing.comment.replace('\r\n', '<br>')

        return outing_list

    except OperationalError:
        # This happens when there is no database
        flash('Base de données injoignable', 'Erreur')
    except ProgrammingError:
        # This occurs when the queried table does not exist
        flash('Structure de la base de données incomplète', 'Erreur')
    except Exception:
        # Catches all the unexpected exceptions
        flash('Erreur: problème avec la base de données')
