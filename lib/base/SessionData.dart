import 'package:shared_preferences/shared_preferences.dart';

class SessionData{
  String plate = "plate";
  String password = "password";
  String token = "token";



  String items = "items";

  userData(response)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(plate, response['vehicle']['plate']);
    await prefs.setString(token, response['token']);
  }
}