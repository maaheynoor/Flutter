import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;
  Future<void> grabLocation() async {
    try {
      Position pos =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = pos.latitude;
      longitude = pos.longitude;
    } catch (e) {
      print(e);
    }
  }
}
