# Version: 16.05.22

from sqlalchemy.sql import *
from sqlalchemy.exc import *

from app.model.models import db, CelestialObjects, Constellations, Types, ObservationDifficulties, Seasons


def get_celestial_objects():
    try:
        celestial_objects = CelestialObjects.query.all()
        # Examples to access join table's values
        # cons = data[0].constellation.name
        # diff = data[0].observation_difficulty.name

        if len(celestial_objects) == 0:
            raise Exception('ERROR: Database is empty')

        return celestial_objects

    except OperationalError:
        # TODO: is it enough ???
        raise Exception('ERROR: Connection to the database failed')
