import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apiKey = '4313443f2515a5c04a08e6d65b8f9f69';
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = "${openWeatherMapURL}?q=${cityName}&units=metric&appid=${apiKey}";
    NetworkHelper networkHelper = new NetworkHelper(url);
    var weathereData = await networkHelper.getData();
    return weathereData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper(
        "${openWeatherMapURL}?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=${apiKey}");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
