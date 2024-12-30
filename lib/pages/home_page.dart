import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/comfort_level.dart';
import 'package:weather/model/weather_model/weather_data_current.dart';
import 'package:weather/utils/utils.dart';
import 'package:weather/widgets/current_weather.dart';
import 'package:weather/widgets/daily_forecast_widget.dart';
import 'package:weather/widgets/header.dart';
import 'package:weather/widgets/hourly_widget.dart';
import 'package:weather/widgets/my_location.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  String dateTime = DateFormat('yMMMMd').format(
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (globalController.checkLoading().isTrue) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/weather_hunder.json',
                height: 200,
                width: 200,
              ),
            );
          } else {
            // Обновляем описание и фоновое изображение
            String description = globalController.weatherData.value.current
                    ?.current.weather?[0].description ??
                "";
            print("THIS IS DESC =====>> $description");
            String backgroundImage =
                WeatherBackground.getBackgroundImage(description);
           
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    backgroundImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // SliverAppBar with Header
                  SliverAppBar(
                    expandedHeight: 150.0,
                    floating: false,
                    pinned: true,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: const Header(),
                    ),
                    //title:  MyLocation(),
                    ),
                  

                  // Main content in SliverList
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        CurrentWeatherWidget(
                          getWeatherDataCurrent: globalController
                              .getWeatherData()
                              .getWeatherDataCurrent(),
                        ),
                        const SizedBox(height: 16),
                        //! Today weather information
                        HourlyWidgwt(
                          heatherHourlyData:
                              globalController.getWeatherData().getHourlyData(),
                        ),
                        //! Next Days Forecast information
                        DailyForecastWidget(
                          daily:
                              globalController.getWeatherData().getDailyData(),
                        ),
                        const SizedBox(
                          height: 0.4,
                          child: ColoredBox(color: Colors.grey),
                        ),

                        ComfortLevel(
                          current: globalController
                              .getWeatherData()
                              .getWeatherDataCurrent(),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
