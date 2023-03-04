import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:dola/helpers/shared_prefs.dart';
import 'package:dola/screens/prepare_ride.dart';

class RideStatus extends StatefulWidget {
  const RideStatus({Key? key}) : super(key: key);

  @override
  State<RideStatus> createState() => _RideStatusState();
}

class _RideStatusState extends State<RideStatus> {
  LatLng currentLocation = getCurrentLatLngFromSharedPrefs();
  late String currentAddress;
  late CameraPosition _initialCameraPosition;
  bool isAccepted = true;
  bool started = false;
  bool completed = true;

  @override
  void initState() {
    super.initState();
    _initialCameraPosition = CameraPosition(target: currentLocation, zoom: 14);
    currentAddress = getCurrentAddressFromSharedPrefs();
    print("access");
    print(dotenv.env['MAPBOX_ACCESS_TOKEN']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Ride Status")),
        body: Column(
          children: [
            // MapboxMap(
            //   initialCameraPosition: _initialCameraPosition,
            //   accessToken:dotenv.env['MAPBOX_ACCESS_TOKEN'],
            //   myLocationEnabled: true,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1,
                      top: MediaQuery.of(context).size.width * .1),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IntrinsicHeight(
                            child: Row(children: [
                          if (!isAccepted)
                            Icon(Icons.check_circle_outline_outlined,
                                color: Colors.green),
                          if (isAccepted) Icon(Icons.circle_outlined),
                          SizedBox(width: 10),
                          const Text(
                            'Looking for Cab',
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 80,
                            child:
                                VerticalDivider(width: 2, color: Colors.grey)),
                        const SizedBox(height: 20),
                        IntrinsicHeight(
                            child: Row(children: [
                          if (isAccepted)
                            Icon(Icons.check_circle_outline_outlined,
                                color: Colors.green),
                          if(!isAccepted)Icon(Icons.circle_outlined),
                          const Text(
                            'Driver Approaching',
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 80,
                            child:
                                VerticalDivider(width: 2, color: Colors.grey)),
                        IntrinsicHeight(
                            child: Row(children: [
                          if (started)
                            Icon(Icons.check_circle_outline_outlined,
                                color: Colors.green),
                          if(!started)Icon(Icons.circle_outlined),
                          SizedBox(width: 10),
                          const Text(
                            'Picked Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            height: 80,
                            child:
                                VerticalDivider(width: 2, color: Colors.grey)),
                        IntrinsicHeight(
                            child: Row(children: [
                          if (completed)
                            Icon(Icons.check_circle_outline_outlined,
                                color: Colors.green),
                          if(!completed)Icon(Icons.circle_outlined),
                          SizedBox(width: 10),
                          const Text(
                            'Dropped Off',
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                      ]),
                ),
            ),
            if (completed) SizedBox(height: 25),
            if (completed)
              ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PrepareRide())),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 114, 94, 1),
                      padding: const EdgeInsets.all(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Pay Now'),
                        ]),
                  )),
          ],
        ));
  }
}
