import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:matatu/pages/auth/otpverify.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseData.dart';
import 'SessionData.dart';

class MyFunctions {
  BaseData baseData = BaseData();
  SessionData sessionData = SessionData();

  requestOtp(context, String plate) async {
    EasyLoading.show(status: "You'll receive an OTP for login");
    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['plate'] = plate;
    var data = jsonDecode(await baseData.postData('requestpass', map));
    debugPrint(data.toString());
    if(data["success"] == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerifyOTPView(plate: plate)));
    }
    debugPrint('data');
    EasyLoading.dismiss();
  }

  loginUser(context, String password,String plate) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['plate'] = plate;
    map['password'] = password;
    debugPrint(map.toString());
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

    debugPrint(data.toString());
    EasyLoading.dismiss();
  }


}
