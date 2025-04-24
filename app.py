from flask import Flask, request
from flask_restful import Api, Resource

app = Flask(__name__)
api = Api(app)

class RequestHandler(Resource):
    def get(self):
        # Read parameters from GET request
        param = request.args.get('param', None)
        if param is None:
            return {'method': 'GET', 'message': 'No parameter provided, default string.'}, 200
        return {'method': 'GET', 'param': param}, 200

    def post(self):
        # Read parameters from POST request (JSON body)
        data = request.get_json()
        param = data.get('param', None)
        if param is None:
            return {'method': 'POST', 'message': 'No parameter provided, default string.'}, 200
        return {'method': 'POST', 'param': param}, 200

api.add_resource(RequestHandler, '/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True, threaded=True)
