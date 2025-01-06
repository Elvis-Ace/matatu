import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../base/BaseData.dart';
class MyTextView extends StatefulWidget {
  int maxlines;
  double fontsize;
  Color color;
  FontWeight fontWeight;
  String data,fontfamily;
  TextAlign textAlign;
  TextDecoration textDecoration;
  MyTextView({super.key, required this.data,this.maxlines = 1,this.color = Colors.black,this.fontsize = 14,this.fontWeight = FontWeight.normal,this.textAlign =TextAlign.start,this.fontfamily = 'roboto',this.textDecoration = TextDecoration.none});
  @override
  State<MyTextView> createState() => _MyTextViewState();
}

class _MyTextViewState extends State<MyTextView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      maxLines: widget.maxlines,
      textAlign: widget.textAlign,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          color: widget.color,
          fontWeight: widget.fontWeight,
          fontSize: widget.fontsize,
          fontFamily: widget.fontfamily,
        ),
        decoration: widget.textDecoration,
      ),
    );
  }
}

//richtext
class MyPriceText extends StatefulWidget {
  String percent,original,offer,fontfamily;
  double fontsize;
  Color colors;
  FontWeight fontWeight;
  MyPriceText(this.offer,this.original,this.percent,this.fontfamily,this.colors,this.fontWeight,this.fontsize,{Key? key}) : super(key: key);

  @override
  State<MyPriceText> createState() => _MyPriceTextState();
}

class _MyPriceTextState extends State<MyPriceText> {
  BaseData baseData = BaseData();
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
          text: '${widget.percent} ',
          style: TextStyle(
            fontWeight: widget.fontWeight,
            fontFamily: widget.fontfamily,
            color: widget.colors
          ),
          children: <TextSpan>[
          TextSpan(
            text: '${widget.original} ',
              style: TextStyle(
                fontFamily: widget.fontfamily,
                decoration: TextDecoration.lineThrough,
                color: baseData.primary
              ),
            ),
           TextSpan(
             text: widget.offer,
             style: TextStyle(
               fontWeight: widget.fontWeight,
               fontFamily: widget.fontfamily,
               color: widget.colors
             ),
           )
        ]
      )
    );
  }
}
class MyFormatedText extends StatefulWidget {
  String original,sub,fontfamily;
  double fontsize;
  Color colors;
  FontWeight fontWeight;
  MyFormatedText(this.original,this.sub,this.fontfamily,this.colors,this.fontWeight,this.fontsize,{Key? key}) : super(key: key);

  @override
  State<MyFormatedText> createState() => _MyFormatedTextState();
}

class _MyFormatedTextState extends State<MyFormatedText> {
  BaseData baseData = BaseData();
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: widget.original,
            style: TextStyle(
                fontWeight: widget.fontWeight,
                fontFamily: widget.fontfamily,
                color:baseData.primary,
                fontSize: widget.fontsize+15
            ),
            children: <TextSpan>[
              TextSpan(
                text: widget.sub,
                style: TextStyle(
                    fontWeight: widget.fontWeight,
                    fontFamily: widget.fontfamily,
                    color: widget.colors,
                    fontSize: widget.fontsize
                ),
              )
            ]
        )
    );
  }
}
