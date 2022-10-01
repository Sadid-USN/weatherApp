import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/hourly.dart';
import 'package:weather/utils/custom_colors.dart';

class HourlyWidgwt extends StatelessWidget {
  final WeatherHourlyData heatherHourlyData;
  HourlyWidgwt({Key? key, required this.heatherHourlyData}) : super(key: key);

  // card index
  RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        listHourly()
      ],
    );
  }

  Widget listHourly() {
    return Container(
      height: 160.0,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: heatherHourlyData.hourly!.length > 12
              ? 18
              : heatherHourlyData.hourly!.length,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90.0,
                  margin: const EdgeInsets.only(left: 20, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.5, 0),
                        blurRadius: 30.0,
                        spreadRadius: 1,
                        color: CustomColors.dividerLine.withAlpha(150),
                      )
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ])
                        : null,
                  ),
                  child: HourlyDetails(
                    index: index,
                    cardIndex: cardIndex.toInt(),
                    timeStamp: heatherHourlyData.hourly![index].dt!,
                    temp: heatherHourlyData.hourly![index].temp!,
                    weatherIcon:
                        "${heatherHourlyData.hourly![index].weather![0].icon}",
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails({
    Key? key,
    required this.timeStamp,
    required this.index,
    required this.cardIndex,
    required this.temp,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Image.asset(
            'assets/weather/$weatherIcon.png',
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "$temp°",
            style: TextStyle(
                fontSize: 14.0,
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
      ],
    );
  }
}
