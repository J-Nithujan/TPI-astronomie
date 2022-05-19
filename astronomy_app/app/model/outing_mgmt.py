# Version: 19.05.22
from datetime import datetime

from sqlalchemy.exc import *

from app.model.forms import OutingForm
from app.model.models import db, Outings


def add_outing(form: OutingForm):
    # Data conversion
    try:
        meeting_time: datetime = datetime.strptime(form.meeting_time.data, '%H:%M %d.%m.%Y')
        duration: datetime = datetime.strptime(form.duration.data, '%H:%M')
        
        outing = Outings(theme=form.theme.data, meeting_time=meeting_time, duration=duration,
                         place=form.place.data, equipment=form.equipments.data, max_people=form.max_people.data,
                         remaining_slots=form.max_people.data, comment=form.comment.data)
        
        # outing.id is None at this moment
        
        db.session.add(outing)
        db.session.commit()
        # Now outing.id exists
        
        return True
    
    except OperationalError:
        form.errors.append('Erreur avec la base de données')
        return False
