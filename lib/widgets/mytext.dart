import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextView extends StatefulWidget {
  final int maxlines;
  final double fontsize;
  final Color colors;
  final FontWeight fontWeight;
  final String data;
  const MyTextView({required this.data, this.maxlines = 1, this.colors = Colors.black,this.fontsize = 14,
    this.fontWeight = FontWeight.normal,Key? key})
      : super(key: key);
  @override
  State<MyTextView> createState() => _MyTextViewState();
}

class _MyTextViewState extends State<MyTextView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      maxLines: widget.maxlines,
      style: GoogleFonts.inter(
        color: widget.colors,
        fontWeight: widget.fontWeight,
        fontSize: widget.fontsize,
      ),
    );
  }
}
