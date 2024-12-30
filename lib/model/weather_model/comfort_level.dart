import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';
import 'package:weather/utils/custom_colors.dart';
import 'package:weather/utils/utils.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent current;
  const ComfortLevel({super.key, required this.current});
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
          child: Text(
            'Comfort level',
            style: CustomTextStyles.boldFont20,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2 * 0.6,
          child: Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                  color: Color(0xff506278).withValues(alpha: 0.6)
                ),
            child: Column(
              children: [
                SleekCircularSlider(
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
                          fontSize: 18.0,
                          height: 1.5,
                          color: CustomColors.dividerLine,
                        )),
                    animationEnabled: true,
                    size: 180,
                    customColors: CustomSliderColors(
                       
                        hideShadow: true,
                        trackColor: CustomColors.infoBlue,
                        progressBarColors: [
                          CustomColors.dividerLine,
                          CustomColors.secondGradientColor,
                        ],
                        
                        ),
                        
                  ),
                ),
               
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.darkBackground.withValues(alpha: 0.5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                             TextSpan(
                              text: 'Feels like ',
                              style: CustomTextStyles.regularFont18,
                            ),
                            TextSpan(
                              text: ' ${current.current.feelsLike}',
                              style: CustomTextStyles.regularFont18,
                            ),
                          ],
                        ),
                      ),
                     
                      RichText(
                        text: TextSpan(
                          children: [
                             TextSpan(
                              text: 'UV Index ',
                              style: CustomTextStyles.regularFont18,
                            ),
                            TextSpan(
                              text: ' ${current.current.uvi}',
                              style: CustomTextStyles.regularFont18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
