import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseData.dart';
import 'SessionData.dart';

class MyFunctions {
  BaseData baseData = BaseData();
  SessionData sessionData = SessionData();

  requestOtp(String plate) async {
    EasyLoading.show(status: "You'll receive an OTP for login");
    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['plate'] = plate;
    var data = await baseData.postData('requestpass', map);
    debugPrint('data');
    EasyLoading.dismiss();
  }

  loginUser(context, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EasyLoading.show(status: "Logging in, please wait");
    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['password'] = password;
    var data = jsonDecode(await baseData.postData('login', map));
    debugPrint(data.toString());
    if (data.containsKey("token")) {
      await sessionData.userData(data);
      Navigator.pushReplacementNamed(context, '/homepage');
    } else {
      EasyLoading.showError("Invalid Credentials");
    }
    EasyLoading.dismiss();
  }

  sendCoordinates(double lat, double long) async {
    EasyLoading.show(status: "You'll receive an OTP for login");
    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    var data = await baseData.postData('coordinates', map);
    debugPrint('data');
    EasyLoading.dismiss();
  }
}