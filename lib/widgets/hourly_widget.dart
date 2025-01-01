import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/model/weather_model/hourly.dart';
import 'package:weather/utils/custom_colors.dart';
import 'package:weather/utils/utils.dart';


class HourlyWidgwt extends StatelessWidget {
  final WeatherHourlyData heatherHourlyData;
  HourlyWidgwt({super.key, required this.heatherHourlyData});

  // card index
 final RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Today',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        SizedBox(height: 8,),
        listHourly()
      ],
    );
  }

  Widget listHourly() {
    return Container(

      height: 170.0,
      padding: const EdgeInsets.only(top: 10, bottom: 10, ),
      margin: const EdgeInsets.only(left: 10, right: 10, ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Color(0xff506278).withValues(alpha: 0.6)
      ),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: heatherHourlyData.hourly!.length > 12
              ? 8
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
                   
                    ],
                   
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
final  int temp;
final  int index;
final  int cardIndex;
final  int timeStamp;
final  String weatherIcon;



 const HourlyDetails({
    super.key,
    required this.timeStamp,
    required this.index,
    required this.cardIndex,
    required this.temp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          child: Row(
           
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Минимизируем ширину контейнера
            children: [
               Text(
                DateFormatters.getTime(timeStamp), // Используем метод getTime
                style: CustomTextStyles.boldFont20,
              ),
              Text(
                DateFormatters.getPeriod(timeStamp), // Используем метод getPeriod
                style: CustomTextStyles.boldFont14, // Используем стиль меньшего размера
              ),
            ],
          ),
        ),
        Image.asset(
          color: CustomColors.dividerLine,
          'assets/icons/clouds.png',
          height: cardIndex == index ?  40 : 35,
         
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            "$temp°",
            style: CustomTextStyles.boldFont18,
            
            
          )
        ),
      ],
    );
  }
}
