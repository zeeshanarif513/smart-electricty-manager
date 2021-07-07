class Admin{
  String name, username, email, password;


  Admin({this.name, this.username, this.email, this.password});

  bool verifyPassword(String pass){
    return this.password == pass;
  }

}