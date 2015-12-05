from app import db

class User(db.Model):
  email = db.Column(db.String(120), index=True, unique=True, primary_key=True)
  password = db.Column(db.String, unique=False)
  name = db.Column(db.String, unique=False)
  
  def is_authenticated(self):
    return True

  def is_active(self):
    return True

  def is_anonymous(self):
    return False

  def get_id(self):
    try:
      return unicode(self.email)
    except NameError:
      return str(self.email)

  def __repr__(self):
    return '<User %r>' % (self.email)