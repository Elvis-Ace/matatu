import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:matatu/base/BaseData.dart';
import 'package:matatu/widgets/mybutton.dart';
import 'package:matatu/widgets/mytext.dart';
class RoutesView extends StatefulWidget {
  const RoutesView({super.key});

  @override
  State<RoutesView> createState() => _RoutesViewState();
}

class _RoutesViewState extends State<RoutesView> {
  BaseData baseData = BaseData();
  List<String> list = ["Select Route"];
  List<dynamic> routes = [];
  String dropdownValue = "Select Route";
  getRoutes()async{
    var response = jsonDecode(await baseData.getData('routes'));
    if(response['success'] == true){
      routes = response['data'];
      for(int i =0;i<response['data'].length;i++){
        list.add(response['data'][i]['name']);
      }
    }

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getRoutes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: MyTextView(data: 'Select Route',),),
      body: Column(
        children: [
          Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          MyButton(text: "View Data", color: Colors.red, function: (){

          })
        ],
      ),
    );
  }
}
