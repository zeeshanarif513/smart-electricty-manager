import 'package:flutter/material.dart';
import 'package:smart_electricity_manager/handle_manually/appliance_handle.dart';


//typedef callback<String>(String value);

// ignore: must_be_immutable
class InputField extends StatefulWidget {
  final bool isPswd;
  final String label;
  final bool isValid; //value is valid?
  final Function callback;
  double height;

  InputField(this.isPswd, this.label, this.height, this.isValid, {this.callback});

  _InputFieldState inp = _InputFieldState();
  void validatePassword(password){
    inp.checkConfirmPass(password);
  }
  void validateUsername(flag){
    inp.inValidUserName(flag);
  }
  @override
  _InputFieldState createState() => inp;
}

class MyColor{
  Color labelColor;
  Color borderColor;
  MyColor(this.labelColor, this.borderColor);
}

class Errors{
  
  bool isEmpty(data){
    if(data.isEmpty)
      return true;
    return false;
  }
  bool isEmail(data){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(data);
  }

  bool validConfirmPass(password, confirmPassword){
    return password == confirmPassword;
  }
  
}

class _InputFieldState extends State<InputField> {
  Errors handleErrors = new Errors();
  final _text = TextEditingController();
  bool _validate = false;
  String value;
  String errorText = "";
  MyColor validColor, inValidColor, selectedColor;
  _InputFieldState(){
    validColor = new MyColor(Color(0xff6cbbc7), Colors.white, );
    inValidColor = new MyColor(Colors.red, Colors.red);
    selectedColor = validColor;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  //only called when input field is confirmpassword
  void checkConfirmPass(password){
    bool res = handleErrors.validConfirmPass(password, _text.text.toString());
    setState(() {
      if(!res){
        _validate = true;
        errorText = "invalid confirm password";
      }
      else{
        _validate = false;
      }      
    });
  }

  //called only when input field is username
  void inValidUserName(flag){
    setState(() {
      if(!flag){
        _validate = true;
        errorText = "invalid username";
      }
      else{
        _validate = false;
      }      
    });
  }
  handleChange(){
    print(_text.text.toString());
    setState(() {
      bool res = handleErrors.isEmpty(_text.text.toString());
      if(res){
        _validate = true;
        errorText = "Value Can\'t Be Empty";
        print(_validate);
      }
      else{
        _validate = false;
        if(widget.label == "EMAIL"){
          res = handleErrors.isEmail(_text.text.toString());
          if(!res){
            _validate = true;
            errorText = "Invalid Email";
          }
          else{
            _validate = false;
          }
        }
      }      
    });
    
    if(this.widget.callback != null)
        this.widget.callback(_text.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    _text.addListener(handleChange);
    setState(() {
      selectedColor = this.widget.isValid? validColor: inValidColor;  
    });
    
    return Material(
      elevation: 10.0,
      shadowColor: Colors.blueGrey,
      child: Container(
        height: this.widget.height,
        child: TextField(
          controller: _text,
          obscureText: widget.isPswd,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: this.selectedColor.borderColor, width: 3.0),),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: this.selectedColor.borderColor, width: 3.0),
            ),
            labelStyle: TextStyle(
              color: this.selectedColor.labelColor,
              fontWeight: FontWeight.bold,
            ),
            labelText: widget.label,
            errorText: _validate ? errorText : null,
          ),
        ),
      ),
    );
  }
}
