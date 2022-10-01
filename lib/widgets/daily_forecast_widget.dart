import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/daily.dart';
import 'package:weather/utils/custom_colors.dart';

class DailyForecastWidget extends StatelessWidget {
  final WeatherDailyData daily;
  DailyForecastWidget({Key? key, required this.daily}) : super(key: key);
  //! 2:17
  // String monipulation

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEEE').format(time);
    return x;
  }

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4 * 3.5,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: CustomColors.secondGradientColor.withAlpha(100),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5, bottom: 10.0),
            child: Text(
              'Next days',
              style: TextStyle(
                color: CustomColors.textColorBlack,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          dailyList(context),
        ],
      ),
    );
  }

  Widget dailyList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 * 1.5,
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: SizedBox(
                height: 0.4,
                width: double.infinity,
                child: ColoredBox(
                  color: Colors.grey,
                ),
              ),
            );
          },
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: daily.daily!.length > 7 ? 7 : 7,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Text(
                              getDay(
                                daily.daily![index].dt,
                              ),
                              style: TextStyle(
                                color: cardIndex.value == index
                                    ? Colors.purple
                                    : CustomColors.textColorBlack,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                                'assets/weather/${daily.daily![index].weather![0].icon}.png'),
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: Text(
                              "${daily.daily![index].temp!.max}°/${daily.daily![index].temp!.min}",
                              style: const TextStyle(
                                color: CustomColors.textColorBlack,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
