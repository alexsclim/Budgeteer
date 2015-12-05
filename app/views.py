from flask import render_template, redirect, session, url_for, request, g
from flask.ext.login import login_user, logout_user, login_required, LoginManager, current_user
from app import app, db, lm, models, bcrypt
from forms import LoginForm, RegisterForm
from .models import User

@lm.user_loader
def load_user(email):
  return User.query.get(email)

@app.before_request
def before_request():
  g.user = current_user

@app.route('/login', methods=['GET', 'POST'])
def login():
  login_form = LoginForm()
  if login_form.validate_on_submit():
    session['remember_me'] = login_form.remember_me.data
    user = User.query.get(login_form.email.data)
    if user:
      if bcrypt.check_password_hash(user.password, login_form.password.data):
        user.authenticated = True
        db.session.add(user)
        db.session.commit()
        remember_me = false
        remember_me = session['remember_me']
        session.pop('remember_me', None)
        login_user(user, remember=remember_me)
        return redirect(url_for('home'))
  return render_template('index.html', lform=login_form, rform=RegisterForm())

@app.route('/register', methods=['GET', 'POST'])
def register():
  register_form = RegisterForm()
  if register_form.validate_on_submit():
    pw_hash = bcrypt.generate_password_hash(register_form.password.data)
    find_user_email = models.User.query.get(register_form.email.data)
    if not find_user_email:
      user = models.User(email=register_form.email.data, name=register_form.name.data,
        password=pw_hash)
      db.session.add(user)
      db.session.commit()
      flash('Account successfully created!')
      return redirect(url_for_('login'))
    else:
      flash('That email has been used before!')
  return render_template('index.html', lform=LoginForm(), rform=register_form)

@app.route('/', methods=['GET', 'POST'])
@app.route('/index', methods=['GET', 'POST'])
def index():
  user = g.user
  return render_template('index.html', lform=LoginForm(), rform=RegisterForm())

@app.route('/home')
@login_required
def home():
  user = g.user
  return render_template('home.html')

@app.route('/logout')
@login_required
def logout():
  logout_user()
  return redirect(url_for('login'))
