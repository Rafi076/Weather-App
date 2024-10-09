from flask import Flask, jsonify, request
import requests

app = Flask(__name__)

@app.route('/weather', methods=['GET'])
def get_weather():
    city = request.args.get('city')
    # Replace with your actual weather API call and logic
    # For example purposes, returning a dummy response
    return jsonify({
        "city": city,
        "temperature": "20°C",
        "humidity": "50%",
        "status": "Sunny"
    })

if __name__ == '__main__':
    app.run(debug=True)
