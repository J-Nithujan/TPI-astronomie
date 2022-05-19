# Version 18.05.22

import datetime

from wtforms import ValidationError


class ValidTime(object):
    def __init__(self, message, empty_message, valid_format='%H:%M %d.%m.%Y'):
        self.valid_format = valid_format
        self.message = message
        self.empty_message = empty_message
    
    def __call__(self, form, field):
        
        if field.data == "":
            raise ValidationError(self.empty_message)
        
        try:
            datetime.datetime.strptime(field.data, self.valid_format)
        except ValueError:
            raise ValidationError(self.message)
        
    
valid_time = ValidTime
