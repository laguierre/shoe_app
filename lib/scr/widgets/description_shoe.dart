import 'package:flutter/material.dart';

class DescriptionShoe extends StatelessWidget {
  const DescriptionShoe(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20
          ),
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)
          ),
          SizedBox(
            height: 20
          ),
          Text(
            description,
            style: TextStyle(color: Colors.black54, height: 1.6)
          )
        ],
      ),
    );
  }
}
