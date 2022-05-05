# Version: 05.05.22

from hashlib import sha256

from app.model.models import Administrators


def check_login(email: str, password: str):
    encoded: bytes = password.encode()
    hashed = sha256(encoded).hexdigest()
    
    admin: Administrators = Administrators.query.filter_by(email=email, password=hashed).first()
    
    if admin:
        return True
    else:
        return False
    