import 'package:flutter/material.dart';

import '../base/BaseData.dart';
import 'mytext.dart';
class MyButton extends StatefulWidget {
  String text;
  Color color,textcolor;
  final VoidCallback action;
  MyButton({required this.text,required this.color,required this.textcolor,required this.action});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: widget.action,
          style: ElevatedButton.styleFrom(
            foregroundColor: widget.textcolor,
            backgroundColor: widget.color,
            padding: const EdgeInsets.all(5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            padding: const EdgeInsets.only(top: 7,bottom: 7),
            child: MyTextView(data:widget.text,color:widget.textcolor,fontsize:17,fontWeight:FontWeight.bold),
          )
      ),
    );
  }
}
// flat button
class MyFlatButton extends StatefulWidget {
  String text;
  Color color,textcolor;
  final VoidCallback action;
  MyFlatButton(this.text,this.color,this.textcolor,this.action);

  @override
  State<MyFlatButton> createState() => _MyFlatButtonState();
}

class _MyFlatButtonState extends State<MyFlatButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.action,
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
        ),
        child: MyTextView(data:widget.text,color:widget.textcolor,fontsize:15,fontWeight:FontWeight.bold,textDecoration: TextDecoration.underline,)
    );
  }
}

//outlined button
class MyOutlinedButton extends StatefulWidget {
  String text;
  final VoidCallback action;
  MyOutlinedButton(this.text,this.action,{Key? key}) : super(key: key);

  @override
  State<MyOutlinedButton> createState() => _OutlinedButtonState();
}

class _OutlinedButtonState extends State<MyOutlinedButton> {
  BaseData baseData = BaseData();
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: widget.action,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextView(data:widget.text,color:Colors.black,fontsize:15,fontWeight:FontWeight.bold,),
            const Icon(Icons.calendar_month)
          ],
        )
    );
  }
}

//round button
class RoundButton extends StatefulWidget {
  IconData icon;
  Function action;
  Color color,iconcolor;
  double size;
  RoundButton(this.icon,this.iconcolor,this.color,this.action,{this.size=35,Key? key}) : super(key: key);

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          widget.action();
        },
        child: CircleAvatar(
          radius: widget.size,
          backgroundColor: widget.color,
          child: Icon(widget.icon,color: widget.iconcolor,),
        ),
      ),
    );
  }
}

//icon button
class MyIconButton extends StatefulWidget {
  IconData icon;
  String text;
  Color color,textcolor;
  final VoidCallback action;
  MyIconButton({Key? key,required this.text,required this.color,required this.textcolor,required this.icon,required this.action}) : super(key: key);

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.action,
      style: ElevatedButton.styleFrom(
        foregroundColor: widget.textcolor,
        backgroundColor: widget.color,
        padding: const EdgeInsets.only(left: 12,right: 12,top: 7,bottom: 7),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextView(data:widget.text,color:widget.textcolor,fontsize:15,fontWeight:FontWeight.bold),
          const SizedBox(width: 5,),
          Icon( // <-- Icon
            widget.icon,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
