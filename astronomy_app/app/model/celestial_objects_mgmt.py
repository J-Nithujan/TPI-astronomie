# File: celestial_objects_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: All the functions used to modify the table 'celestial_objects' of the database
# Version: 16.05.2022

from flask import flash
from sqlalchemy.exc import *

from app.model.models import db, CelestialObjects, Constellations, Types, ObservationDifficulties, Seasons


def get_celestial_objects() -> list[CelestialObjects]:
    """
    Gets the celestial objects with the rows used for the foreign keys
    
    :return: A list of all the CelestialObjects in the database
    """
    try:
        celestial_objects = CelestialObjects.query.order_by(CelestialObjects.id).all()

        if len(celestial_objects) == 0:
            flash('Erreur: Base de données vide')

        return celestial_objects

    except OperationalError:
        flash('Erreur: Base de données injoignable')
