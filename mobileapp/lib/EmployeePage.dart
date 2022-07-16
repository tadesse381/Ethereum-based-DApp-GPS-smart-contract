import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'EmployeeModel.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  var locationMessage = "";
  String lat_1 = "0.00";
  String lon_1 = "0.00";
  String status = "not sending";
  bool isSwitched = false;
  int i = 0;
  late StreamSubscription<Position> positionStream;
  void stopUpdate() {
    positionStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<EmployeeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Location"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Get User Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Lask Known Location:\n" + locationMessage),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.amber,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    var position = await Geolocator().getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    var lat = position.latitude;
                    var lon = position.longitude;

                    lat_1 = lat.toString();
                    lon_1 = lon.toString();

                    print("Not Encrypted \nLatitude: $lat, Longitude: $lon");
                    setState(() {
                      locationMessage = "Latitude: $lat_1\nLongitude: $lon_1";
                    });
                  },
                  child: Text('Get Current Location'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Track Location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      // final LocationSettings locationSettings = LocationSettings( // accuracy: LocationAccuracy.high, // distanceFilter: 100, // );
                      var geolocator = Geolocator();
                      var locationOptions = LocationOptions(
                        accuracy: LocationAccuracy.high,
                        distanceFilter: 100,
                      );
                      // ignore: unused_local_variable
                      positionStream =
                          geolocator.getPositionStream(locationOptions).listen(
                        (Position position) {
                          setState(
                            () {
                              print("Tracking On");
                              value = true;
                              isSwitched = true;
                              print(position == null
                                  ? 'Unknown'
                                  : position.latitude.toString() +
                                      ', ' +
                                      position.longitude.toString());
                              lat_1 = position.latitude.toString();
                              lon_1 = position.longitude.toString();
                              listModel.addCoordinates(
                                lat_1,
                                lon_1,
                              );
                              status = "Latitude: $lat_1\nLongitude: $lon_1";
                              locationMessage =
                                  "Latitude: $lat_1\nLongitude: $lon_1";
                            },
                          );
                        },
                      );
                    } else {
                      print("Tracking Off");
                      value = false;
                      isSwitched = false;
                      stopUpdate();
                    }
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              SizedBox(
                height: 20.0,
              ),
              listModel.isLoading ? Text("No Data") : Text(status),
              SizedBox(
                height: 100.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.amber,
                ),
                child: MaterialButton(
                  onPressed: () async {
                    final String googleMapsUrl =
                        "https://www.google.com/maps/search/?api=1&query=$lat_1,$lon_1";
                    final String appleMapsUrl =
                        "https://maps.apple.com/?q=$lat_1,$lon_1";
                    if (await canLaunch(googleMapsUrl)) {
                      await launch(googleMapsUrl);
                    }
                    if (await canLaunch(appleMapsUrl)) {
                      await launch(appleMapsUrl, forceSafariVC: false);
                    } else {
                      throw "Couldn't launch URL";
                    }
                  },
                  child: Text('View in Maps'),
                ),
              ),
            ]),
      ),
    );
  }
}
