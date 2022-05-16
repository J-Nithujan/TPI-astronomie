# Version: 05.05.22

from hashlib import sha256

from sqlalchemy.exc import *

from app.model.models import Administrators
from app.model.forms import LoginForm


def check_login(form: LoginForm):
    encoded: bytes = form.password.data.encode()
    hashed = sha256(encoded).hexdigest()
    try:
        admin: Administrators = Administrators.query.filter_by(email=form.email.data).first()

        if admin:
            if admin.password == hashed:
                return True
            else:
                form.password.errors.append('Mot de passe incorrect')
        else:
            form.login.errors.append('Utilisateur inexistant')
            return False

    except OperationalError:
        form.login.errors.append('Erreur avec la base de données')
        return False

