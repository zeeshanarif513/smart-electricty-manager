import 'package:flutter/material.dart';

class DisplayStatus extends StatelessWidget {
  final bool isConnected;
  final String sensor, reading;

  DisplayStatus({this.sensor, this.isConnected, this.reading = "0"});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: Colors.blueGrey,
      borderRadius: BorderRadius.circular(10.0),
      child: isConnected
          ? Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          sensor,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff6cbbc7),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "(Connected)",
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    reading,
                    style: TextStyle(
                      fontSize: 150.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Working Well",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff6cbbc7), width: 3.0),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          : Container(
            height: 300,
            child: Center(
                child: Text(
                  "Not Connected",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff6cbbc7),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ),
    );
  }
}
