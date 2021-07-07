import 'package:flutter/material.dart';


// ignore: camel_case_types
typedef callback<int>(int isSwitched);
class ApplianceHandle extends StatefulWidget {
  final String _text;
  final IconData _ic;
  final ValueSetter<bool> callback;
  ApplianceHandle(this._text, this._ic,{this.callback}){
    //this.callback(false);
  }
  @override
  _ApplianceHandleState createState() => _ApplianceHandleState(this._text, this._ic);
}


class _ApplianceHandleState extends State<ApplianceHandle> {
  bool isSwitched = false;
  String _text;
  IconData _ic;
  _ApplianceHandleState(this._text, this._ic){
    //widget.callback(false);
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    this._ic,
                    color: Color(0xff6cbbc7),
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    this._text,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6cbbc7)),
                  ),
                ],
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                    widget.callback(this.isSwitched);
                  });
                },
                activeTrackColor: Color(0xff81dfee),
                activeColor: Color(0xff2cb3c7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
