# Version: 05.05.22

from flask_wtf import FlaskForm
from wtforms import validators, EmailField, PasswordField, SubmitField
from wtforms.validators import length


class LoginForm(FlaskForm):
    email = EmailField('Email', validators=[length(min=1, message='Indiquer une adresse mail')],
                       render_kw={'placeholder': ' '})
    password = PasswordField('Mot de passe', validators=[length(min=1, message='Indiquer un mot de passe')],
                             render_kw={'placeholder': ' '})
    login = SubmitField('Se connecter')
