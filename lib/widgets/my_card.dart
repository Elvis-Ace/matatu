import 'package:flutter/material.dart';
import 'mytext.dart';

class MobileCards extends StatefulWidget {
  String title, data, image;

  MobileCards(
      {required this.title,
      required this.data,
      required this.image,
      super.key});

  @override
  State<MobileCards> createState() => _MobileCardsState();
}

class _MobileCardsState extends State<MobileCards> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,  // Adjust the height value as needed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        color: Color(0xFFA8CEFF),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: MyTextView(
                      data: widget.title,
                      fontsize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: MyTextView(
                      data: widget.data,
                      fontsize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 20, 0),
                child: Image.asset(
                  widget.image,
                  // Replace with your image asset path
                  width: 50,
                  height: 50,
                  // You can adjust width and height as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
