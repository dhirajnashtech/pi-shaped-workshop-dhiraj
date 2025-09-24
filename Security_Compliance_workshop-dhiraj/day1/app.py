# app.py

from flask import Flask
import os

app = Flask(__name__)

#    SECRET_API_KEY = "REMOVED"
app.config['SECRET_KEY'] = 'SECRET_API_KEY'

@app.route('/')
def home():
    return "Gitleaks implimentation working!"

if __name__ == '__main__':
    # Port and host configuration for Docker
    app.run(host='0.0.0.0', port=8080)
