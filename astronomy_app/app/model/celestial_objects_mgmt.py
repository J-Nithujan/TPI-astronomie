# File: celestial_objects_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: All the functions used to modify the table 'celestial_objects' of the database
# Version: 24.05.2022

from flask import flash
from sqlalchemy.exc import *

from app.model.models import CelestialObjects


def get_celestial_objects() -> list[CelestialObjects]:
    """
    Gets the celestial objects with the rows used for the foreign keys
    
    :return: A list of all the CelestialObjects in the database
    """
    try:
        celestial_objects = CelestialObjects.query.order_by(CelestialObjects.id).all()

        if len(celestial_objects) == 0:
            flash('Base de données vide', 'Erreur')

        return celestial_objects

    except OperationalError:
        # This happens when there is no database
        flash('Base de données injoignable', 'Erreur')
    except ProgrammingError:
        # This occurs when the queried table does not exist
        flash('Structure de la base de données incomplète', 'Erreur')
    except Exception:
        # Catches all the unexpected exceptions
        flash('Erreur: problème avec la base de données')
