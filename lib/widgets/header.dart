import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/controller/global_controller.dart';
import 'package:weather/utils/addbunner_helper.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  BannerAdHelper bannerAdHelper = BannerAdHelper();
  String city = '';

  String dateTime = DateFormat('yMMMMd').format(
    DateTime.now(),
  );
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
    getAddres(
      globalController.getLattitude().value,
      globalController.getLongitude().value,
    );
    bannerAdHelper.initializeAdMob(
      onAdLoaded: (ad) {
        setState(() {
          bannerAdHelper.isBannerAd = true;
        });
      },
    );
  }

  @override
  void dispose() {
    bannerAdHelper.bannerAd.dispose();
    super.dispose();
  }

  getAddres(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bannerAdHelper.isBannerAd
            ? SizedBox(
                height: bannerAdHelper.bannerAd.size.height.toDouble(),
                width: bannerAdHelper.bannerAd.size.width.toDouble(),
                child: bannerAdHelper.buildAdWidget(),
              )
            : const SizedBox(),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            city,
            style: const TextStyle(
              height: 2.0,
              fontSize: 28.0,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Text(
            dateTime,
            style: TextStyle(
              height: 1.5,
              fontSize: 14.0,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
