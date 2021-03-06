# File: forms.py
# Author: Nithujan Jegatheeswaran
# Brief: This module contains all the form used on the website
# Version: 25.05.2022

import datetime

from flask_wtf import FlaskForm
from wtforms import EmailField, PasswordField, SubmitField, StringField, TextAreaField, SelectMultipleField, \
    IntegerField
from wtforms.validators import length, optional, number_range, regexp

from app.model.form_validators import valid_time


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


class NewOutingForm(FlaskForm):
    """
    Class used to create the html code and handle the validation of the form used to add a new outing
    """
    # Required fields
    theme = StringField('Thème *', validators=[length(min=1, message='Indiquer un thème pour la sortie')],
                        render_kw={'placeholder': ' '})

    meeting_time = StringField('Date et heure *', validators=[
        valid_time(message='Indiquer une date et une heure de rendez-vous au format HH:MM jj.mm.aaaa',
                   empty_message='Indiquer une heure et une date de rendez-vous')],
                               render_kw={'placeholder': datetime.datetime.now().strftime('%H:%M %d.%m.%Y'),
                                          'min': datetime.datetime.now()})

    duration = StringField('Durée *', validators=[
        valid_time(valid_format='%H:%M', message='Indiquer la durée de la sortie au format HH:MM',
                   empty_message='Indiquer la durée de la sortie')], render_kw={'placeholder': 'hh:mm'})

    place = StringField('Lieu de rendez-vous *', validators=[length(min=1, message='Indiquer un lieu de rendez-vous ')],
                        render_kw={'placeholder': ' '})

    max_people = IntegerField('Nombre de personnes max. *',
                              validators=[number_range(min=1, message='Indiquer un nombre de participants')],
                              render_kw={'min': 0, 'value': 0})

    # Optional fields
    celestial_objects = SelectMultipleField('Objets célestes concernés', validators=[optional()],
                                            render_kw={'data-live-search': 'true'})

    equipments = TextAreaField('Equipements', validators=[optional()])
    comment = TextAreaField('Commentaire', validators=[optional()])

    add_outing = SubmitField('Ajouter')


class OutingRegistrationForm(FlaskForm):
    """
    Class used for user registration to a night outing
    """
    email = EmailField('Email',
                       validators=[length(min=1, max=100, message='Indiquer une adresse email (max. 100 caractères)')],
                       render_kw={'placeholder': ' '})

    firstname = StringField('Prénom',
                            validators=[length(min=1, max=50, message='Indiquer un prénom (max. 50 caractères)')],
                            render_kw={'placeholder': ' '})

    lastname = StringField('Nom', validators=[length(min=1, max=50, message='Indiquer un nom (max. 50 caractères)')],
                           render_kw={'placeholder': ' '})

    age = IntegerField('Age', validators=[number_range(min=1, max=100, message='Indiquer un âge (entre 1 et 100)')],
                       render_kw={'min': 0, 'max': 150, 'value': 0})

    phone_number = StringField('Numéro de téléphone', validators=[
        regexp(r'\d{3} \d{3} \d{2} \d{2}', message='Indiquer un numéro de télphone au format XXX XXX XX XX')],
                               render_kw={'placeholder': 'XXX XXX XX XX'})

    submit = SubmitField('S\'inscrire')
