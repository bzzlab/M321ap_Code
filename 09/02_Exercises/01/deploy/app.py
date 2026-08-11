import signal
import time
from threading import Event, Thread
from flask import Flask, jsonify
from werkzeug.serving import make_server


app = Flask(__name__)
stop_event = Event()
is_ready = True


@app.route('/')
def index():
    return 'hello from app', 200


@app.route('/healthz')
def healthz():
    # readiness + liveness endpoint; return 200 when ready
    return (jsonify({'ready': is_ready}), 200) if is_ready else (jsonify({'ready': False}), 500)


@app.route('/shutdown')
def shutdown():
    # Called by preStop to start graceful shutdown
    global is_ready
    is_ready = False
    # set event so main thread will stop server
    stop_event.set()
    return 'shutdown initiated', 200


class ServerThread(Thread):
    def __init__(self, app):
        Thread.__init__(self)
        self.srv = make_server('0.0.0.0', 4000, app)
        self.ctx = app.app_context()
        self.ctx.push()


    def run(self):
        print('starting server')
        self.srv.serve_forever()


    def shutdown(self):
        print('shutting down server')
        self.srv.shutdown()


if __name__ == '__main__':
    server = ServerThread(app)
    server.start()


    # handle SIGTERM to trigger same graceful shutdown path
    def handle_term(signum, frame):
        global is_ready
        print('SIGTERM received')
        is_ready = False
        stop_event.set()

    signal.signal(signal.SIGTERM, handle_term)

    # wait until shutdown event is set
    stop_event.wait()

    # give a short window for in-flight work to complete
    print('waiting up to 10s for graceful completion...')
    time.sleep(10)

    server.shutdown()
    print('exited')