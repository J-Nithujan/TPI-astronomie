# Version: 05.05.22

from flask_wtf import FlaskForm
from wtforms import validators, EmailField, PasswordField, SubmitField
from wtforms.validators import InputRequired


class LoginForm(FlaskForm):
    email = EmailField('Email', validators=[])
    password = PasswordField('Mot de passe', validators=[])
    login = SubmitField('Se connecter')
