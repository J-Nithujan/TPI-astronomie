# Version: 05.05.22

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# TODO: Relationship tables
outing_has_celestial_object: db.Table = db.Table('outing_has_celestial_object',
                                                 db.Column('id', db.Integer, autoincrement=True, primary_key=True),
                                                 db.Column('outing_id', db.Integer, db.ForeignKey('outings.id'),
                                                           primary_key=True,
                                                           nullable=False),
                                                 db.Column('celestial_object_id', db.Integer,
                                                           db.ForeignKey('celestial_objects.id'), primary_key=True,
                                                           nullable=False))


#
# user_has_outing: db.Table = db.Table()


class Administrators(db.Model):
    """
    This class represents the table ``administrators`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    email: db.Column = db.Column(db.String(100), nullable=False, unique=True)
    password: db.Column = db.Column(db.String(64), nullable=False)


class Constellations(db.Model):
    """
        This class represents the table ``constellations`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name: db.Column = db.Column(db.String(30), nullable=False, unique=True)
    
    celestial_objects: db.relationship = db.relationship('CelestialObjects', lazy=True, backref='constellation')


class ObservationDifficulties(db.Model):
    """
        This class represents the table ``observation_difficulties`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name: db.Column = db.Column(db.String(15), nullable=False, unique=True)
    
    celestial_objects: db.relationship = db.relationship('CelestialObjects', lazy=True,
                                                         backref='observation_difficulty')


class Seasons(db.Model):
    """
        This class represents the table ``seasons`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name: db.Column = db.Column(db.String(10), nullable=False, unique=True)
    
    celestial_objects: db.relationship = db.relationship('CelestialObjects', lazy=True, backref='season')


class Types(db.Model):
    """
        This class represents the table ``types`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name: db.Column = db.Column(db.String(30), nullable=False, unique=True)
    
    celestial_objects: db.relationship = db.relationship('CelestialObjects', lazy=True, backref='type')


class CelestialObjects(db.Model):
    """
    This class represents the table ``celestial_objects`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    messier_number: db.Column = db.Column(db.String(4), nullable=False, unique=True)
    ngc_number: db.Column = db.Column(db.String(10))
    right_ascension: db.Column = db.Column(db.String(15))
    declination: db.Column = db.Column(db.String(7))
    apparent_magnitude: db.Column = db.Column(db.Numeric(4, 2))
    size: db.Column = db.Column(db.String(15))
    distance: db.Column = db.Column(db.String(10))
    picture: db.Column = db.Column(db.String(100))
    
    # Foreign keys
    constellation_id: db.Column = db.Column(db.Integer, db.ForeignKey('constellations.id'), nullable=False)
    observation_difficulty_id: db.Column = db.Column(db.Integer, db.ForeignKey('observation_difficulties.id'),
                                                     nullable=False)
    season_id: db.Column = db.Column(db.Integer, db.ForeignKey('seasons.id'), nullable=False)
    type_id: db.Column = db.Column(db.Integer, db.ForeignKey('types.id'), nullable=False)
    
    # Elements of relationship
    # TODO: recheck and change to many-to-many
    outings: db.relationship = db.relationship('Outings', secondary=outing_has_celestial_object, lazy=True,
                                               backref='celestial_objects')


class Outings(db.Model):
    """
    A class used to query the table ``outings`` of the database
    """
    id: db.Column = db.Column(db.Integer, autoincrement=True, primary_key=True)
    theme: db.Column = db.Column(db.String(50), nullable=False, unique=True)
    meeting_time = db.Column(db.DateTime)
    duration = db.Column(db.Time)
    place = db.Column(db.String(100))
    equipment = db.Column(db.Text)
    max_people = db.Column(db.Integer)
    remaining_slots = db.Column(db.Integer)
    comment = db.Column(db.Text)
