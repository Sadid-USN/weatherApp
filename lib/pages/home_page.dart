import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/comfort_level.dart';
import 'package:weather/widgets/current_weather.dart';
import 'package:weather/widgets/daily_forecast_widget.dart';
import 'package:weather/widgets/header.dart';
import 'package:weather/widgets/hourly_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          (() => globalController.checkLoading().isTrue
              ? Center(
                  child: Lottie.asset(
                    'assets/lottie/weather_hunder.json',
                    height: 200,
                    width: 200,
                  ),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Header(),
                    //! current temp
                    CurrentWeatherWidget(
                      getWeatherDataCurrent: globalController
                          .getWeatherData()
                          .getWeatherDataCurrent(),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    //! today weather information
                    HourlyWidgwt(
                      heatherHourlyData:
                          globalController.getWeatherData().getHourlyData(),
                    ),
                    //! Next Days Forecast information
                    DailyForecastWidget(
                      daily: globalController.getWeatherData().getDailyData(),
                    ),
                    const SizedBox(
                      height: 0.4,
                      child: ColoredBox(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ComfortLevel(
                      current: globalController
                          .getWeatherData()
                          .getWeatherDataCurrent(),
                    )
                  ],
                )),
        ),
      ),
    );
  }
}
