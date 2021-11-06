import 'package:flutter/material.dart';

class OrangeBtn extends StatelessWidget {
  const OrangeBtn({Key? key, required this.text, this.height = 50, this.width = 150, this.color = Colors.orange}) : super(key: key);

  final double height;
  final double width;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text('$text', style: TextStyle(color: Colors.white),),
    );
  }
}
