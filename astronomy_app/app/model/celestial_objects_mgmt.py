# Version: 16.05.22

from flask import flash
from sqlalchemy.sql import *
from sqlalchemy.exc import *

from app.model.models import db, CelestialObjects, Constellations, Types, ObservationDifficulties, Seasons


def get_celestial_objects() -> list[CelestialObjects]:
    """
    Gets the celestial objects with the rows used for the foreign keys
    
    :return: A list of all the CelestialObjects in the database
    """
    try:
        celestial_objects = CelestialObjects.query.all()
        # Examples to access join table's values
        # cons = data[0].constellation.name
        # diff = data[0].observation_difficulty.name

        if len(celestial_objects) == 0:
            flash('Erreur: Base de données vide')

        return celestial_objects

    except OperationalError:
        # TODO: is it enough ???
        flash('Erreur: Base de données injoignable')
