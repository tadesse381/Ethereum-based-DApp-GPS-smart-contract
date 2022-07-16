import 'package:flutter/material.dart';
import 'EmployerModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployerPage extends StatefulWidget {
  const EmployerPage({Key? key}) : super(key: key);

  @override
  _EmployerPageState createState() => _EmployerPageState();
}

class _EmployerPageState extends State<EmployerPage> {
  String locationMessage = "No data yet";

  String lat_1 = "0.00";
  String lon_1 = "0.00";

  @override
  Widget build(BuildContext context) {
    var listModel = Provider.of<EmployerModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Colors.amber,
                ),
                child: MaterialButton(
                  onPressed: () {
                    listModel.getCoordinates();
                    lat_1 = listModel.latitude;
                    lon_1 = listModel.longitude;
                    //print('hi' + lat_1);
                    //print('hi' + lon_1);
                    setState(() {
                      locationMessage = "Latitude: $lat_1\nLongitude: $lon_1";
                    });
                    Text(locationMessage);
                  },
                  child: Text('View Employee Location'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              listModel.isLoading
                  ? Text(
                      "Employee Last known Location: \nNo Data",
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Coordinates:\n" + locationMessage,
                      textAlign: TextAlign.center,
                    ),
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
                    if (lat_1 == "0.00" && lon_1 == "0.00") {
                      print("No data yet");
                    }
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
