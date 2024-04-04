import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../base/functions.dart';
import '../../widgets/mybutton.dart';
import '../../widgets/mytext.dart';
import '../../widgets/mytextfields.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  MyFunctions functions = MyFunctions();
  final plate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 50),

            Image.asset(
              'assets/images/otp.jpg',
              height: 200,
            ),

            const SizedBox(height: 50),

            const Center(
              child: MyTextView(
                data: 'Enter Plate Number',
                fontsize: 20,
                fontWeight: FontWeight.bold,
                maxlines: 1,
              ),
            ),

            const SizedBox(height: 10),
            MyTextField(hintstrin: 'Enter Number Plate', controller: plate),

            const SizedBox(height: 25),
            MyButton(
                text: "Send OTP",
                color: Colors.blue,
                function: () async {
                  if(plate.text.isEmpty){

                  }else{
                    EasyLoading.show(status: "Loading Please Wait");
                    await functions.requestOtp(
                      context,
                      plate.text,
                    );
                  }
                }
            ),

            const SizedBox(height: 50),

            MyButton(text: "Dashboard", color: Colors.green, function: (){
              
            })
          ],
        ),
      ),
    );
  }
}
