# Version: 05.05.22

from flask_wtf import FlaskForm
from wtforms import validators, EmailField, PasswordField, SubmitField, StringField, DateTimeLocalField, TimeField, \
    TextAreaField, SelectMultipleField, IntegerField, SelectField
from wtforms.validators import length, optional, regexp


class LoginForm(FlaskForm):
    """
    Class used to create the html code of the login form and also used to check the form validation
    """
    # The validators check that at least one character is typed
    # The placeholder are needed to correctly render the floating label
    email = EmailField('Email', validators=[length(min=1, message='Indiquer une adresse mail')],
                       render_kw={'placeholder': ' '})
    password = PasswordField('Mot de passe', validators=[length(min=1, message='Indiquer un mot de passe')],
                             render_kw={'placeholder': ' '})
    
    login = SubmitField('Se connecter')


class OutingForm(FlaskForm):
    """
    Class used to create the html code and handle the validation of the form used to add a new outing
    """
    # Required fields
    theme = StringField('Thème', validators=[length(min=1, message='Indiquer un thème pour la sortie')],
                        render_kw={'placeholder': ' '})
    meeting_time = DateTimeLocalField('Date et heure',
                                      validators=[
                                          length(min=1, message='Indiquer une date et une heure de rendez-vous'),
                                          regexp(regex='%Y-%m-%dT%H:%M',
                                                 message='Indiquer une date et une heure au format ...')],
                                      render_kw={'placeholder': ' '})
    # TODO: message d'erreurs + validation
    duration = TimeField('Durée', validators=[length(min=1, message='Indiquer une durée')])
    place = StringField('Lieu de rendez-vous', validators=[length(min=1, message='Indiquer un lieu de rendez-vous ')],
                        render_kw={'placeholder': ' '}
                        )
    max_people = IntegerField('Nombre de personnes max.',
                              validators=[length(min=1, message='Indiquer un lieu de rendez-vous ')],
                              render_kw={'min': 0, 'value': 0})
    
    # Optional fields
    celestial_objects = SelectField('Objets célestes concernés', validators=[optional()], choices=['1', '2', '3'],
                                    render_kw={'data-live-search': 'true'})
    equipments = TextAreaField('Equipements', validators=[optional()])
    comment = TextAreaField('Commentaire', validators=[optional()])
    
    add_outing = SubmitField('Ajouter')
