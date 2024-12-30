from app import app, db
from models import User, Game, Transaction
import sqlite3
import mysql.connector

def migrate_data():
    # Connect to SQLite databases
    sqlite_conn = sqlite3.connect('database.db')
    sqlite_cursor = sqlite_conn.cursor()

    # Connect to MySQL
    mysql_conn = mysql.connector.connect(
        host="localhost",
        user="your_mysql_username",
        password="your_mysql_password",
        database="user_db"
    )
    mysql_cursor = mysql_conn.cursor()

    # Migrate Users
    sqlite_cursor.execute("SELECT * FROM user")
    users = sqlite_cursor.fetchall()
    
    for user in users:
        # Adjust this based on your actual columns
        mysql_cursor.execute("""
            INSERT INTO user (id, username, email, password_hash, is_banned, role, created_at)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, user)

    # Migrate Games and Transactions similarly
    # ... (similar process for other tables)

    mysql_conn.commit()
    mysql_cursor.close()
    mysql_conn.close()
    sqlite_cursor.close()
    sqlite_conn.close()

if __name__ == "__main__":
    migrate_data()