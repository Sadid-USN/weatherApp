import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';
import 'package:weather/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent current;
  const ComfortLevel({Key? key, required this.current}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 1,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          padding: const EdgeInsets.all(15.0),
          child: const Text(
            'Comfort level',
            style: TextStyle(fontSize: 18, color: CustomColors.textColorBlack),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 * 0.6,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: current.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 3,
                      trackWidth: 5,
                      progressBarWidth: 18,
                    ),
                    infoProperties: InfoProperties(
                        bottomLabelText: 'Humidity',
                        bottomLabelStyle: const TextStyle(
                          letterSpacing: 0.1,
                          fontSize: 14.0,
                          height: 1.5,
                        )),
                    animationEnabled: true,
                    size: 180,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor: Colors.cyan.withAlpha(80),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor,
                        ]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Feels like ',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' ${current.current.feelsLike}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                    width: 1,
                    child: ColoredBox(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'UV Index ',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' ${current.current.uvi}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            height: 0.8,
                            color: CustomColors.textColorBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
