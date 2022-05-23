# Version: 19.05.22
from datetime import datetime

from flask import flash
from sqlalchemy.exc import *
from sqlalchemy.sql import select

from app.model.forms import NewOutingForm
from app.model.models import db, Outings, CelestialObjects


def add_outing(form: NewOutingForm):
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
        form.errors.append('Erreur lors de la transaction avec la base de données')
        return False


def get_outing_list():
    """
    Gets the complete list of all the existing outings

    :return: A list of Outings ordered by id
    """
    try:
        outing_list: list[Outings] = Outings.query.order_by(Outings.id).all()

        if len(outing_list) == 0:
            flash('Erreur: Base de données vide')
        else:
            for outing in outing_list:
                outing.meeting_time = outing.meeting_time.strftime('%d.%m.%Y %H:%M')
                outing.duration = outing.duration.strftime('%H:%M')

        return outing_list

    except OperationalError:
        flash('Erreur: Base de données injoignable')
