from flask import Flask, jsonify
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.ext.flask.middleware import XRayMiddleware
import logging

app = Flask(__name__)

# Configuração do X-Ray
xray_recorder.configure(service='alo-mundo-sigas')
XRayMiddleware(app, xray_recorder)

# Configuração básica de Logs
logging.basicConfig(level=logging.INFO)

@app.route('/', methods=['GET'])
def hello():
    app.logger.info("Endpoint Alo Mundo acessado")
    return jsonify({"message": "Alo Mundo!", "status": "operacional"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
