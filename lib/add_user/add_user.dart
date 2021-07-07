import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/adminpanel/admin_panel.dart';

import '../widgets/welcome_text.dart';
import '../widgets/input_field.dart';
import '../widgets/my_button.dart';
import '../widgets/bottom_text.dart';

class AddUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xff6cbbc7)),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Add User",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Welcome(),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputField(false, "NAME", 50.0, true),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(false, "USERNAME", 50.0, true),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(false, "EMAIL", 50.0, true),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "PASSWORD", 50.0, true),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputField(true, "CONFIRM PASSWORD", 50.0, true),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "Cancel", goto: AdminPanel(),),
                      SizedBox(width: 10.0,),
                      MyButton(text:"Add", goto: AdminPanel()),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
