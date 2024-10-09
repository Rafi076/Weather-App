import requests

API_KEY = 'your_openweather_api_key'
BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

def get_weather_data(city):
    params = {
        'q': city,
        'appid': API_KEY,
        'units': 'metric'
    }
    response = requests.get(BASE_URL, params=params)
    
    if response.status_code == 200:
        data = response.json()
        weather_info = {
            'city': data['name'],
            'temperature': data['main']['temp'],
            'humidity': data['main']['humidity'],
            'description': data['weather'][0]['description'],
            'time': data['dt'],
            'sunrise': data['sys']['sunrise'],
            'sunset': data['sys']['sunset']
        }
        return weather_info
    return None
