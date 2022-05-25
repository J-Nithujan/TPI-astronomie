# File: administrator_mgmt.py
# Author: Nithujan Jegatheeswaran
# Brief: This module cotains the functions used to manipulate the administrator table
# Version: 25.05.22

from hashlib import sha256

from sqlalchemy.exc import *

from app.model.models import Administrators
from app.model.forms import LoginForm


def check_login(form: LoginForm) -> bool:
    """
    Checks that an admin with the email given in the form exists and that his/her password is correct

    :param form: the form submitted by the website's user
    :return: True if login is successfull, False otherwise
    """
    encoded: bytes = form.password.data.encode()
    hashed = sha256(encoded).hexdigest()
    try:
        admin: Administrators = Administrators.query.filter_by(email=form.email.data).first()

        if admin:
            if admin.password == hashed:
                return True
            else:
                form.password.errors.append('Identifiants incorrects')
                return False
        else:
            form.login.errors.append('Identifiants incorrects')
            return False

    except OperationalError:
        form.login.errors.append('Erreur: Base de données inexistante')
        return False
    except ProgrammingError:
        form.login.errors.append('Erreur: Structure de la base de données incomplète')
        return False
    except Exception:
        form.login.errors.append('Erreur: problème avec la base de données')
        return False
