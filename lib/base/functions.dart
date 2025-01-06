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
    var data = await baseData.postData('requestpass', map);
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
    var data = await baseData.postData('login', map);
    debugPrint(data.toString());
    if (data["success"] == true) {
      await sessionData.userData(data["data"]);
      Navigator.pushReplacementNamed(context, '/matatu');
    } else {
      EasyLoading.showError("Invalid Credentials");
    }
    EasyLoading.dismiss();
  }

  sendCoordinates(double lat, double long) async {
    BaseData baseData = BaseData();
    Map map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = long;
    var data = await baseData.postData('coordinates', map);

    debugPrint(data.toString());
    EasyLoading.dismiss();
  }


}
