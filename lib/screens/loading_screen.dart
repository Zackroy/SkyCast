import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position); // Debug print

    // LocationPermission permission = await Geolocator.requestPermission();
    //
    // if (permission == LocationPermission.deniedForever) {
    //   // Handle denied forever case
    //   print('Location permission denied forever');
    // } else if (permission == LocationPermission.denied) {
    //   // Handle denied case
    //   print('Location permission denied');
    // } else {
    //   Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.low,
    //   );
    //   print(position);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print("Button pressed"); // Debug print
            getLocation(); // Request permission when button is pressed
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
