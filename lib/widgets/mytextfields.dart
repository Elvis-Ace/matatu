import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyTextField extends StatefulWidget {
  final String hintstrin;
  bool secure;
  TextInputType textInputType;
  TextEditingController controller;

  MyTextField(
      {required this.hintstrin,
      this.textInputType = TextInputType.name,
      required this.controller,
      this.secure = false,
      Key? key})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool secure = false;
  checksecurity() {
    secure = widget.secure;
    setState(() {});
  }

  @override
  void initState() {
    checksecurity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        keyboardType: widget.textInputType,
        controller: widget.controller,
        obscureText: secure,
        style: const TextStyle(color: Colors.black),
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          hintText: widget.hintstrin,
          hintStyle: TextStyle(color: Colors.grey[500]),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.white ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.secure) {
                secure = false;
                setState(() {});
              } else {
                widget.controller.clear();
              }
            },
            icon: widget.secure
                ? const Icon(Icons.remove_red_eye)
                : Icon(Icons.clear),
          ),
        ),
      ),
    );
  }
}

//icon textfield
class FormTextField extends StatefulWidget {
  final String hintstrin;
  bool secure;
  TextInputType textInputType;
  TextEditingController controller;
  IconData icon;
  FormTextField(this.hintstrin, this.textInputType, this.controller,
      this.secure, this.icon);

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  bool secure = false;
  checksecurity() {
    secure = widget.secure;
    setState(() {});
  }

  @override
  void initState() {
    checksecurity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.textInputType,
      controller: widget.controller,
      obscureText: secure,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: widget.hintstrin,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.blueAccent),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (widget.secure) {
                secure = false;
                setState(() {});
              } else {
                widget.controller.clear();
              }
            },
            icon: widget.secure
                ? const Icon(Icons.remove_red_eye)
                : Icon(Icons.clear),
          ),
          prefixIcon: Icon(widget.icon)),
    );
  }
}


class FilterTextField extends StatefulWidget {
  final String hintstrin;
  TextEditingController controller;
  Function action;
  FilterTextField({required this.hintstrin,required this.controller,required this.action,super.key});

  @override
  State<FilterTextField> createState() => _FilterTextFieldState();
}

class _FilterTextFieldState extends State<FilterTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: widget.controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: widget.hintstrin,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.blueAccent),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              widget.controller.clear();
            },
            icon: const Icon(Icons.clear),
          )),
      onChanged: (val) {
        widget.action();
      },
      onEditingComplete: (){
        debugPrint('Ace Here');
      },
    );
  }
}

// This is for calender only

class CalenderTextField extends StatefulWidget {
  final String hintstrin;
  TextEditingController controller;
  Function() action;
  CalenderTextField({required this.hintstrin,required this.controller,required this.action,super.key});

  @override
  State<CalenderTextField> createState() => _CalenderTextFieldState();
}

class _CalenderTextFieldState extends State<CalenderTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          icon: const Icon(Icons.calendar_today_rounded),
          hintText: widget.hintstrin,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.blueAccent),
          ),
      ),
      onTap: () {
        widget.action();
      },
    );
  }
}


