import 'package:geolocator/geolocator.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:location/location.dart';

import '../utlis/utils.dart';

class FunnctionsHelper {

   FunnctionsHelper._();

   ///* Checks if the device has an active internet connection
  static Future<bool> hasInternet() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }


  ///* Retrieves the current location of the device.
 static Future getLocation() async {
    PermissionStatus? permissionGranted;
    Location location = Location();
    bool serviceEnabled;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locData = await Geolocator.getCurrentPosition();
  }
}
