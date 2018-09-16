from lblog2 import app

@app.route('/')
def index():
    return "Hello world."