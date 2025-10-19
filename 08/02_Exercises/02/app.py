from flask import Flask

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return 'Welcome to Modul 321!'

if __name__ == '__main__':
    app.run(host='0.0.0.0')



