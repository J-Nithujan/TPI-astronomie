# Version: 16.05.22

from flask import Flask, render_template, redirect, url_for, request, session, flash

from app.model.celestial_objects_mgmt import *
from app.model.forms import LoginForm, OutingForm
from app.model.administrator_mgmt import check_login
from app.model.outing_mgmt import add_outing

app = Flask(__name__)
app.config.from_object('config')


@app.route('/')
def index():
    """
    Displays the index page
    
    :return: Renders the template index.html
    """
    if 'user' in session:
        return render_template('index.html', title='Accueil', user=session['user'])
    else:
        return render_template('index.html', title='Accueil')


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
            flash('Login réussi')
            return redirect(url_for('index'))
        else:
            # Login failed
            return render_template('login.html', title='Login', form=form)
    else:
        # Access by menu
        return render_template('login.html', title='Login', form=form)


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
    Displays the page with the Messier catalog objects
    
    :return: Renders the template catalog.html ....
    """
    celestial_objects = get_celestial_objects()
    
    if 'user' in session:
        return render_template('catalog.html', title='Catalogue Messier', user=session['user'], list=celestial_objects)
    else:
        return render_template('catalog.html', title='Catalogue Messier', list=celestial_objects)
    pass


@app.route('/new_outing/', methods=['POST', 'GET'])
def new_outing():
    """
    Displays the form used by the admins to add a new outing
    
    :return: Renders the template new-outing.html or redirect to the outing list when the form has been fully validated
    """
    form = OutingForm()

    _celestial_objects = get_celestial_objects()
    _choices: list = []
    for obj in _celestial_objects:
        _choices.append(obj.messier_number)
        
    form.celestial_objects.choices = _choices

    if form.validate_on_submit():
        if add_outing(form):
            # Outing successfully added
            return redirect(url_for('index'))
            # return redirect(url_for('outings'))
        else:
            # Error/s in the form
            return render_template('new_outing.html', title='Nouvelle sortie', user=session['user'], form=form)
    else:
        # Access by menu
        return render_template('new_outing.html', title='Nouvelle sortie', user=session['user'], form=form)


@app.route('/outings/')
def outings():
    """
 
    :return:
    """
    pass


@app.route('/edit_outings/')
def edit_outings():
    """
    
    :return:
    """
    pass
