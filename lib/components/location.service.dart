
import 'dart:async';

import 'package:flutter_tutorial/components/user_location.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  StreamController<UserLocation> locationStreamController = StreamController<UserLocation>();
  Stream<UserLocation>get locationStream => locationStreamController.stream;

  LocationService() {
    location.requestPermission().then((permissionStatus) {
      if(permissionStatus == PermissionStatus.granted){
        location.onLocationChanged.listen((locationData){
          locationStreamController.add(UserLocation(
            longitude: locationData.longitude ?? 0.0,
            latitude: locationData.latitude ?? 0.0
          ));
        });
      }
    });
  }

  void dispose() =>locationStreamController.close();
}