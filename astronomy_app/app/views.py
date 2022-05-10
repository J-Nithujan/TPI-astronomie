# Version: 05.05.22

from flask import Flask, render_template, redirect, url_for, request, session

from app.model.forms import LoginForm
from app.model.administrator_mgmt import check_login

app = Flask(__name__)
app.config.from_object('config')


@app.route('/')
def index():
    """
    Displays the index page
    
    :return: Renders the template index.html
    """
    if 'email' in session:
        return render_template('index.html', title='Accueil', user=session['email'])
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
            # login success
            session['email'] = form.email.data
            return redirect(url_for('index'))
        else:
            # login failed
            return render_template('login.html', title='Login', form=form)
    else:
        # access by menu
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
    Displays the page with the Messier catalog object
    
    :return: Renders the template catalog.html ....
    """
    pass


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
