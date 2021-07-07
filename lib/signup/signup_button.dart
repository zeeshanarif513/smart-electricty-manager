
import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/domain/admin.dart';

import '../adminpanel/admin_panel.dart';

import 'package:http/http.dart' as http;



class SignupButton extends StatelessWidget {
  Admin admin;
  String confirmPass;
  Function callback;

  SignupButton(this.admin, this.confirmPass, {this.callback});

  bool isEmpty(){
    if(admin.name == null || admin.name == " ")
      return true;
    else if(admin.username == null || admin.username == " ")
      return true;
    else if(admin.email == null || admin.email == " ")
      return true;
    else if(admin.password == null || admin.password == " ")
      return true;
    else if(this.confirmPass == null || this.confirmPass== " ")
      return true;
    else
      return false;
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(this.isEmpty()){
          callback("Field(s) are empty");
        }
        else if(!admin.email.contains('@')){
          callback("invalid email");
        }
        else if(admin.password != this.confirmPass){
          callback("invalid confirm password");
        }
        else{
          addUser(admin).then((res) {
            final data = jsonDecode(res.body)['message'];
            if(data == "user added"){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPanel()),
              );
            }
            else{
              callback(data);
            }
          }); 
        }
      },
      child: Container(
        height: 50.0,
        width: 150.0,
        margin: EdgeInsets.only(top: 5.0, left: 180.0, right: 0.0),
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
              "Sign Up",
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

  Future<http.Response> addUser(admin)  async {
    final response = http.post(
    Uri.parse('http://192.168.10.9:3000/adduser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      
    },
    body: jsonEncode(<String, String>{
      'name': admin.name,
      'username': admin.username,
      'email': admin.email,
      'password': admin.password,
      'role': 'admin',
      }),
      );
      return response;
      
  }
}

