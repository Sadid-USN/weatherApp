import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/daily.dart';
import 'package:weather/utils/custom_colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:weather/utils/utils.dart';

class DailyForecastWidget extends StatelessWidget {
  final WeatherDailyData daily;
  DailyForecastWidget({super.key, required this.daily});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEEE').format(time);
    return x;
  }

  final RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 5,),
         Text(
           'Next days',
           style: CustomTextStyles.boldFont20,
         ),
        const SizedBox(height: 5.0),
        dailyCarousel(context),
      ],
    );
  }

  Widget dailyCarousel(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
       
        height: 250,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 2.0,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          cardIndex.value = index;
        },
      ),
      itemCount: daily.daily!.length > 7 ? 7 : daily.daily!.length,
      itemBuilder: (context, index, realIndex) {
        final dayData = daily.daily![index];
        return Container(
          width: MediaQuery.sizeOf(context).width,
         
         
          decoration: BoxDecoration(
            color: Color(0xff506278).withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(16.0),
            
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getDay(dayData.dt),
                style: CustomTextStyles.boldFont18,
              ),
              const SizedBox(height: 10),
              Container(
         
              
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(16.0),
                 
                ),
                child: Image.asset(
                  'assets/weather/${dayData.weather![0].icon}.png',
                  height: 70,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "${dayData.temp!.max}°/${dayData.temp!.min}°",
                style: CustomTextStyles.boldFont16,
              ),
            ],
          ),
        );
      },
    );
  }
}
