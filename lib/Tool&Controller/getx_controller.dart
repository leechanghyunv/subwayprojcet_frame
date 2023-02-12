import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../Model/model.dart';
import 'notification.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class GetX_Notification extends GetxController {
  double streamlat = 0.0, streamlng = 0.0;
  double lat1 = 0.0, lng1 = 0.0;
  double testlat = 37.785834, testlng = -122.406417;
  String engName = 'SEOUL';
  String subwayName = '서울';
  var loading = false.obs;

  late StreamSubscription? _getPositionSubscription =
  Geolocator.getPositionStream(
      locationSettings:
      const LocationSettings(accuracy: LocationAccuracy.best))
      .listen((Position? position) {
    print(position == null
        ? 'Unknown'
        : '****${position.latitude.toString()}, ****${position.longitude.toString()}');
    position == null ? 'Unknown' : streamlat = position.latitude;
    position == null ? 'Unknown' : streamlng = position.longitude;
  });


  void save_position(List<SubwayModel> SubwayInfo, String Name){
    final index =
    SubwayInfo.indexWhere((element) => element.name == Name);

    lat1 = SubwayInfo[index].lat;
    lng1 = SubwayInfo[index].lng;
    engName = SubwayInfo[index].engname;
    subwayName = SubwayInfo[index].name;
  }

  void findMyposition(List<SubwayModel> SubwayInfo, String Name) {
    final index =
    SubwayInfo.indexWhere((element) => element.name == Name);

    lat1 = SubwayInfo[index].lat;
    lng1 = SubwayInfo[index].lng;
    engName = SubwayInfo[index].engname;
    subwayName = SubwayInfo[index].name;

    /// /// /// // /// // /// 현위치 37.785834, -122,406417 // testlat.testlng
    if (lat1.toStringAsExponential(2) == streamlat.toStringAsExponential(2) &&
        lng1.toStringAsExponential(2) == streamlng.toStringAsExponential(2)) {
      Noti.showBigTextNotification(
          title: "목적지에 곧 도착합니다.",
          body: "목적지인 ${subwayName}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
          fln: flutterLocalNotificationsPlugin);
      Noti.showBigTextNotification(
          title: "목적지에 곧 도착합니다.",
          body: "목적지인 ${subwayName}(으)로 이동합니다. 내리실때 안전에 유의해 주시기 바랍니다.",
          fln: flutterLocalNotificationsPlugin)
          .then((value) => _getPositionSubscription?.pause());
      loading = true.obs;
    } else {
      _getPositionSubscription?.resume();
      loading = false.obs;

    }
  }

  @override
  void onInit() {
    Noti.initialize(flutterLocalNotificationsPlugin);
    super.onInit();
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 25,
  );

  void CallNotification() {
    Noti.showBigTextNotification(
        title: "NOTIFICATION을 시작합니다.",
        body: "${engName}에 도착했습니다",
        fln: flutterLocalNotificationsPlugin);
  }
}
