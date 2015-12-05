import os
from flask import Flask
from config import basedir
from flask.ext.login import LoginManager
from flask.ext.bcrypt import Bcrypt
from flask.ext.sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config.from_object('config')
db = SQLAlchemy(app)
bcrypt = Bcrypt()
lm = LoginManager()
lm.init_app(app)
lm.login_view = 'login'

from app import views, models