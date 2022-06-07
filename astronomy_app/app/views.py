# File: views.py
# Author: Nithujan Jegatheeswaran
# Brief: File with all the URLs of the website
# Version: 25.05.2022

from flask import Flask, render_template, redirect, url_for, session

from app.model.celestial_objects_mgmt import *
from app.model.administrator_mgmt import *
from app.model.outing_mgmt import *
from app.model.user_mgmt import *

app = Flask(__name__)
app.config.from_object('config')


@app.route('/')
def index():
    """
    Displays the index page
    
    :return: Renders the template index.html
    """
    if 'user' in session:
        return render_template('index.html', user=session['user'])
    else:
        return render_template('index.html')


@app.route('/login/', methods=['POST', 'GET'])
def login():
    """
    Display the login page and the its form
    
    :return: Renders the template login.html or redirect to the index page when the user has successfully logged
    """
    form = LoginForm()
    if form.validate_on_submit():
        if check_login(form):
            # Login success
            session['user'] = form.email.data
            session.permanent = True
            flash('Login réussi', 'Info')
            return redirect(url_for('index'))
        else:
            # Login failed
            return render_template('login.html', form=form)
    else:
        # Access by menu
        return render_template('login.html', form=form)


@app.route('/logout/')
def logout():
    """
    Clears the Flask app's session variable
    
    :return: Redirect to the index page
    """
    session.clear()

    return redirect(url_for('index'))


@app.route('/catalog/')
def catalog():
    """
    Displays the page with the objects of the Messier catalog

    :return: Renders the template catalog.html
    """
    celestial_objects = get_celestial_objects()

    if 'user' in session:
        return render_template('catalog.html', user=session['user'], list=celestial_objects)
    else:
        return render_template('catalog.html', list=celestial_objects)
    pass


@app.route('/new_outing/', methods=['POST', 'GET'])
def new_outing():
    """
    Displays the form used by the admins to add a new outing
    
    :return: Renders the template new-outing.html or redirect to the outing list when the form has been fully validated
    """
    form = NewOutingForm()

    celestial_objects = get_celestial_objects()
    choices: list = []
    for obj in celestial_objects:
        choices.append(obj.messier_number)

    form.celestial_objects.choices = choices

    if form.validate_on_submit():
        if add_outing(form):
            # Outing successfully added
            return redirect(url_for('outings'))
        else:
            # Error/s in the form
            return render_template('new_outing.html', user=session['user'], form=form)
    else:
        # Access by menu
        return render_template('new_outing.html', user=session['user'], form=form)


@app.route('/outings/')
def outings():
    """
    This function is used to access the list of outing
    
    :return: Renders the template outing_list.html
    """
    outing_list = get_outing_list()

    if 'user' in session:
        return render_template('outing_list.html', user=session['user'], list=outing_list)
    else:
        return render_template('outing_list.html', list=outing_list)


@app.route('/outings/register/<outing_id>/', methods=['POST', 'GET'])
def register_for_outing(outing_id: int):
    """
    Displays the page with the form used to register for an outing and handles its submission
    
    :return: Renders the template outing_register.html or redirect to /outings
    """
    form = OutingRegistrationForm()

    if form.validate_on_submit():
        # Add user to the database
        save_registration(form, outing_id)
        flash('Inscription à la sortie réussie', 'Info')
        return redirect(url_for('outings'))
    else:
        if 'user' in session:
            return render_template('outing_register.html', user=session['user'], form=form, outing_id=outing_id)
        else:
            return render_template('outing_register.html', form=form, outing_id=outing_id)
