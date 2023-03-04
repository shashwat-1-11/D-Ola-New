import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:dola/helpers/shared_prefs.dart';

class CurrentRide extends StatefulWidget {
  const CurrentRide(
      {Key? key, required this.riderAdd, required this.destination})
      : super(key: key);
  final String riderAdd;
  final String destination;
  @override
  State<CurrentRide> createState() => _CurrentRideState();
}

class _CurrentRideState extends State<CurrentRide> {
  String source = "Delhi";
  String destination = "Mumbai";
  String fare = "100";
  String date = "1/1/23";
  bool pickedUp = false;
  bool droppedOff = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Current Ride")),
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
            Padding(
                padding: EdgeInsets.only( top: 15),
                child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    padding: EdgeInsets.all(20),
                    // height: 100,
                    decoration: BoxDecoration(
                        boxShadow: const [
                           BoxShadow(
                            color: Color.fromARGB(255, 99, 97, 97),
                            offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text("Source: $source",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      Text("Fare: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      Text("Destination: $destination",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        if (pickedUp)
                          Icon(Icons.check_circle_outline_outlined,
                              color: Colors.green),
                        Container(
                          alignment: Alignment.center,
                          //  width: MediaQuery.of(context).size.width * .8,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                pickedUp = true;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Colors.blue[900]!,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                // width: MediaQuery.of(context).size.width * 0.,
                                child: Text(
                                  'Picked Up',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ]),
                      Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        if (droppedOff)
                          Icon(Icons.check_circle_outline_outlined,
                              color: Colors.green),
                       Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                droppedOff = true;
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Colors.blue[900]!,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ))),
                            child: Container(
                                padding: const EdgeInsets.all(12),
                                // width: MediaQuery.of(context).size.width * 0.,
                                child: Text(
                                  'Dropped Off',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                        ),
                      ])
                    ]))),
          
          ])),
    );
  }
}
