import 'package:flutter/material.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';
import 'package:weather/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent getWeatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.getWeatherDataCurrent});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tempeture area

        TempetureAreaWidget(
          weatherIcon: getWeatherDataCurrent.current.weather![0].icon ?? '',
          temperature: getWeatherDataCurrent.current.temp!.toInt(),
          weatherDescription:
              getWeatherDataCurrent.current.weather![0].description ?? "",
        ),
        const SizedBox(height: 10),
        WeatherDetailsWidget(
          windSpeed: getWeatherDataCurrent.current.windSpeed ?? 0,
          clouds: getWeatherDataCurrent.current.clouds ?? 0,
          humidity: getWeatherDataCurrent.current.humidity ?? 0,
        ),
      ],
    );
  }
}

class TempetureAreaWidget extends StatelessWidget {
  final String weatherIcon; // Иконка погоды
  final int temperature; // Температура
  final String weatherDescription; // Описание погоды

  const TempetureAreaWidget({
    super.key,
    required this.weatherIcon,
    required this.temperature,
    required this.weatherDescription,
  });

  @override
  Widget build(BuildContext context) {
    String formatTemperature(int temperature) {
      switch (temperature.sign) {
        case 1: // Положительное значение
          return "$temperature°";
        case -1: // Отрицательное значение
          return "-$temperature°";
        case 0: // Ноль
          return "$temperature°";
        default:
          return "$temperature°";
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/weather/$weatherIcon.png',
              height: 45,
              width: 45,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: formatTemperature(temperature),
                    style: TextStyle(
                      color: CustomColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.black26),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: weatherDescription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherDetailsWidget extends StatelessWidget {
  final double windSpeed; // Скорость ветра
  final int clouds; // Облачность
  final int humidity; // Влажность

  const WeatherDetailsWidget({
    super.key,
    required this.windSpeed,
    required this.clouds,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDetailText("${windSpeed}km/h"),

        const SizedBox(height: 10.0),

        _buildDetailIcon('assets/icons/windspeed.png'),
        // _buildDetailText("${clouds}%"),
        // _buildDetailText("${humidity}%"),
      ],
    );
  }

  Widget _buildDetailIcon(String assetPath) {
    return Image.asset(
      assetPath,
      height: 30,
      color: Colors.white,
    );
  }

  Widget _buildDetailText(String text) {
    return SizedBox(
      height: 20,
      width: 60,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
