import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetGeoLocationData extends GetxController {
  double latVV = 0.0, lngVV = 0.0;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    latVV = position.latitude;
    lngVV = position.longitude;
  }
}