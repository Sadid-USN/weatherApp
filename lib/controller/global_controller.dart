import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/API/fetch_weather.dart';
import 'package:weather/model/weather_model/all_weather_data.dart';

class GlobalController extends GetxController {
  // create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currenIndex = 0.obs;

  // create instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = AllWeatherData().obs;

  // ignore: body_might_complete_normally_nullable
  AllWeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }

  getLocation() async {
    LocationPermission locationPermission;
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return is service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }
    // status of permission request

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission are denied Forever');
    } else if (locationPermission == LocationPermission.denied) {
      // request a new permission

      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location is denied');
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update our latitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling weather API

      return FetchWeatherAPI()
          .progressData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
        update();
      });
    });
  }

  RxInt getIndex() {
    return _currenIndex;
  }
}
