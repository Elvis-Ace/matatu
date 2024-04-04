import 'package:matatu/widgets/mytext.dart';
import 'package:flutter/material.dart';
class MyButton extends StatefulWidget {
  String text;
  Color color;
  VoidCallback function;
  MyButton({required this.text,required this.color,required this.function,super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ElevatedButton(
        onPressed: (){
          widget.function();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: widget.color, width: 1),
          padding: const EdgeInsets.all(25),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )
        ),
        child: MyTextView(data: widget.text, fontsize: 18,colors: widget.color,)
      ),
    );
  }
}


class PsIconButton extends StatefulWidget {
  IconData icon;
  Color color;
  VoidCallback function;
  PsIconButton({required this.icon,required this.color,required this.function,super.key});

  @override
  State<PsIconButton> createState() => _PsIconButtonState();
}

class _PsIconButtonState extends State<PsIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.function();
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5,bottom: 5),
        decoration: BoxDecoration(
          border: Border.all(color: widget.color),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Icon( // <-- Icon
          widget.icon,
          size: 24.0,
          color: widget.color,
        ),
      ),
    );
  }
}


class MyIconButton extends StatefulWidget {
  IconData icon;
  String text;
  Color color;
  VoidCallback function;
  MyIconButton({required this.icon,required this.text,required this.color,required this.function,super.key});

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        widget.function();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: widget.color, width: 1),
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
      ),
      icon: Icon( // <-- Icon
        widget.icon,
        size: 24.0,
        color: widget.color,
      ),
      label: MyTextView(data: widget.text, fontsize: 18,colors: widget.color,), // <-- Text
    );
  }
}

class MyPureButton extends StatefulWidget {
  String text;
  Color color,textcolor;
  VoidCallback function;
  double padd;
  MyPureButton({required this.text,required this.color,required this.function,this.padd =10,this.textcolor = Colors.white,super.key});

  @override
  State<MyPureButton> createState() => _MyPureButtonState();
}

class _MyPureButtonState extends State<MyPureButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          widget.function();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            side: BorderSide(color: widget.color, width: 1),
            padding: EdgeInsets.only(top: widget.padd,bottom: widget.padd),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        ),
        child: MyTextView(data: widget.text, fontsize: 18,colors: widget.textcolor,)
    );
  }
}
