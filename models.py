from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from extensions import db
from datetime import datetime
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["scrypt"])

class User(UserMixin, db.Model):
    __bind_key__ = 'user_db'  # Untuk database terpisah
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(150), unique=True, nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    password_hash = db.Column(db.String(128))
    is_banned = db.Column(db.Boolean, default=False)
    banned_at = db.Column(db.DateTime)
    ban_reason = db.Column(db.String(200))
    role = db.Column(db.String(20), default='user')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    transactions = db.relationship('Transaction', backref='user', lazy=True)
    
    def __repr__(self):
        return f'<User {self.username}>'
    
    def set_password(self, password):
        # Meng-hash password menggunakan scrypt
        self.password_hash = pwd_context.hash(password)

    def check_password(self, password):
        # Memverifikasi password dengan scrypt
        return pwd_context.verify(password, self.password_hash)

class Game(db.Model):
    __bind_key__ = 'user_db'  # Untuk database terpisah
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    image = db.Column(db.String(200))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    transactions = db.relationship('Transaction', backref='game', lazy=True)
    
    def __repr__(self):
        return f'<Game {self.name}>'

class Transaction(db.Model):
    __bind_key__ = 'user_db'  # Untuk database terpisah
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    game_id = db.Column(db.Integer, db.ForeignKey('game.id'), nullable=False)
    user_game_id = db.Column(db.String(100), nullable=False)
    item_name = db.Column(db.String(100), nullable=False)
    amount = db.Column(db.Float, nullable=False)
    payment_method = db.Column(db.String(50), nullable=False)
    status = db.Column(db.String(20), default='pending')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __repr__(self):
        return f'<Transaction {self.id}>'
    
