class WeatherBackground {
  static String getBackgroundImage(String weatherDescription) {
    switch (weatherDescription) {
      case 'clear sky':
        return 'assets/images/clearSky.png';
      case 'few clouds':
        return 'assets/images/fewclouds.png';
      case 'overcast clouds':
        return 'assets/images/overcastClouds.png';
      case 'fog':
        return 'assets/images/fog.png';
      case 'mist':
        return 'assets/images/mist.png';
      case 'rain':
        return 'assets/images/rainWindow.png';
      case ' light rain':
        return 'assets/images/lightRain.png';
      case 'broken clouds':
        return 'assets/images/brokenClouds.png';
      case 'scattered clouds':
        return 'assets/images/scatteredClouds.png';
      case 'shower rain':
        return 'assets/images/showerRain.png';
      case 'snow':
        return 'assets/images/snow.png';
      case 'thunderstorm':
        return 'assets/images/thunderstorm.png';
      default:
        return 'assets/images/defaultBg.png'; // на случай, если не удастся найти описание
    }
  }
}
