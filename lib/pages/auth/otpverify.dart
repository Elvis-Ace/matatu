import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../base/functions.dart';
import '../../widgets/mybutton.dart';
import '../../widgets/mytext.dart';

class VerifyOTPView extends StatefulWidget {
  String plate;
  VerifyOTPView({required this.plate,super.key});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  MyFunctions functions = MyFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextView(
              data: 'Verification Code',
              fontsize: 25,
              fontWeight: FontWeight.bold,
              maxlines: 1,
            ),
            SizedBox(height: 16),
            MyTextView(
              data: 'We sent you a verification code',
              fontsize: 18,
              fontWeight: FontWeight.w500,
              maxlines: 1,
            ),
            SizedBox(height: 32),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode) async {
                EasyLoading.show(status: "Logging in, please wait");
                await functions.loginUser(
                  context,
                  verificationCode,
                  widget.plate
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
