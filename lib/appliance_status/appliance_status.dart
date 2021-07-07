import 'package:flutter/material.dart';

import '../widgets/custom_title.dart';
import 'view_appliance.dart';
import 'view_speed.dart';

class ApplianceStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(
            15.0,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Appliances Status",
                style: TextStyle(
                  color: Color(0xff495355),
                  fontSize: 25.0,
                  fontFamily: 'Bradley',
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTitle("Light"),
              ViewAppliance("light", Icons.lightbulb, false),
              CustomTitle("Fan"),
              ViewAppliance("Fan", Icons.ac_unit, true),
              ViewSpeed(status: true,speed: 4,),
            ],
          ),
        ));
  }
}
