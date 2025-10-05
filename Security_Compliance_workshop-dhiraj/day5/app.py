from flask import Flask
import os


app = Flask(__name__)
# app.secret_key = "hardcoded_super_secret_key"  # Hardcoded secret
app.secret_key = os.environ.get("FLASK_SECRET_KEY", "default-secret")

@app.route("/")
def home():
    return "Welcome to the Flask Security Demo App!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
