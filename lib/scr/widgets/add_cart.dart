import 'package:flutter/material.dart';
import 'package:shoe_app/scr/widgets/btn_custom.dart';

class AddCart extends StatelessWidget {
  const AddCart({Key? key, required this.amount}) : super(key: key);

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              '\$$amount',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            OrangeBtn(text: 'Add to Cart'),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
