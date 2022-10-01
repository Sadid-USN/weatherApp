import 'package:flutter/material.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';
import 'package:weather/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent getWeatherDataCurrent;
  const CurrentWeatherWidget({Key? key, required this.getWeatherDataCurrent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // tempeture area
        tempetureAreaWidget(),
        const SizedBox(
          height: 20,
        ),
        weatherDetailsWidget(),
      ],
    );
  }

  Widget tempetureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${getWeatherDataCurrent.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        const SizedBox(
          height: 50,
          width: 1,
          child: ColoredBox(
            color: CustomColors.dividerLine,
          ),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${getWeatherDataCurrent.current.temp!.toInt()}°",
              style: const TextStyle(
                color: CustomColors.textColorBlack,
                fontWeight: FontWeight.w600,
                fontSize: 60,
              ),
            ),
            TextSpan(
              text: "${getWeatherDataCurrent.current.weather![0].description}",
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget weatherDetailsWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.asset('assets/icons/windspeed.png'),
          ),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.asset('assets/icons/clouds.png'),
          ),
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Image.asset('assets/icons/humidity.png'),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${getWeatherDataCurrent.current.windSpeed}km/h",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${getWeatherDataCurrent.current.clouds}%",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${getWeatherDataCurrent.current.humidity}%",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
