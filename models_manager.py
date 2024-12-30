from flask_login import UserMixin
from extensions import db
from passlib.context import CryptContext

# Setup hashing password dengan passlib (scrypt)
pwd_context = CryptContext(schemes=["scrypt"], deprecated="auto")

class Manager(UserMixin, db.Model):
    __bind_key__ = 'manager_db'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(128))
    is_active = db.Column(db.Boolean, default=True)  # Tambahkan kolom is_active

    @property
    def is_manager(self):
        return True
    
    def get_id(self):
        return str(self.id)

    # Meng-hash password menggunakan passlib
    def set_password(self, password):
        self.password_hash = pwd_context.hash(password)

    # Memverifikasi password menggunakan passlib
    def check_password(self, password):
        return pwd_context.verify(password, self.password_hash)
