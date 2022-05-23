# Version 23.05.22

import datetime

from wtforms import ValidationError


class ValidTime(object):
    """
    Validator used with a datetime format and a custom error message
    """

    def __init__(self, message, empty_message, valid_format='%H:%M %d.%m.%Y'):
        self.valid_format = valid_format
        self.message = message
        self.empty_message = empty_message

    def __call__(self, form, field):
        # Check if field is empty
        if field.data == "":
            raise ValidationError(self.empty_message)

        # Tries to convert the field's data to the requested format
        try:
            datetime.datetime.strptime(field.data, self.valid_format)
        except ValueError:
            raise ValidationError(self.message)


valid_time = ValidTime
