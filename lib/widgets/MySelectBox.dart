import 'package:matatu/base/BaseData.dart';
import 'package:flutter/material.dart';
class MySelectBox extends StatefulWidget {
  List<String> items;
  String value;
  final void Function(String) action;
  MySelectBox(this.items,this.value,this.action,{Key? key}) : super(key: key);

  @override
  State<MySelectBox> createState() => _MySelectBoxState();
}

class _MySelectBoxState extends State<MySelectBox> {
  BaseData baseData = BaseData();
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 16,
      isExpanded: true,
      iconSize: 20,
      value: widget.value,
      style: TextStyle(color: baseData.basecolor),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      items: widget.items.map((e) =>DropdownMenuItem(
          value: e,
          child: Text(e)
      )
      ).toList(),
      onChanged: (String? string){
        String val = string!;
        widget.action(val);
        widget.value = val;
        setState((){});
      },
    );
  }
}