app.py:
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from Jenkins Pipeline!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

requirements.txt:
flask==2.3.2
pytest==7.4.0

test_app.py:
from app import app

def test_home():
    response = app.test_client().get('/')
    assert response.status_code == 200
    assert b"Hello from Jenkins Pipeline!" in response.data

