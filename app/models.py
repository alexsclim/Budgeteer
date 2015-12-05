from app import db

class User(db.Model):
  email = db.Column(db.String(120), index=True, unique=True, primary_key=True)
  password = db.Column(db.String, unique=False)
  name = db.Column(db.String, unique=False)
  
@property
def is_authenticated(self):
  return True

@property
def is_active(self):
  return True

@property
def is_anonymous(self):
  return False