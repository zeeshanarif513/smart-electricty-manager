import 'package:flutter/material.dart';

import '../user_panel/user_panel.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPanel()),
        );
      },
      child: Container(
        height: 60.0,
        width: 130.0,
        margin: EdgeInsets.only(top: 20.0, left: 200.0, right: 0.0),
        decoration: BoxDecoration(
            color: Color(0xff6cbbc7),
            borderRadius: BorderRadius.circular(10.0)),
        child: ListTile(
          trailing: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          title: Align(
            alignment: Alignment(1.2, -0.2),
            child: Text(
              "Login",
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
