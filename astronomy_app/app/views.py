# Version: 05.05.22

from flask import Flask, render_template, redirect, url_for, session

from app.model.forms import LoginForm
from app.model.administrator_mgmt import check_login

app = Flask(__name__)
app.config.from_object('config')


@app.route('/')
def index():
    return render_template('index.html', title='Accueil')


@app.route('/login/', methods=['POST', 'GET'])
def login():
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
    

@app.route('/catalog/')
def catalog():
    pass


@app.route('/outings/')
def outings():
    pass
