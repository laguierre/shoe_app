import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/scr/models/shoe_model.dart';
import 'custom_widgets.dart';

class SizePreviewShoe extends StatelessWidget {
  SizePreviewShoe({Key? key, this.fullScreen = false}) : super(key: key);

  final bool fullScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30.0,
            vertical: fullScreen ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: fullScreen? 410: 430,
          decoration: BoxDecoration(
            color: Color(0xFFFFCF53),
            borderRadius: !fullScreen
                ? BorderRadius.circular(50.0)
                : BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)),
          ),
          child: Column(
            children: [
              _ShadowShoe(),
              if (!fullScreen) _SizeShoe(),
            ],
          ),
        )),onTap: (){
      if(!fullScreen)
        Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionShoePage()));
    },);
  }
}

class _ShadowShoe extends StatelessWidget {
  const _ShadowShoe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ModelShoe>(context);
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(children: [
        Positioned(
            bottom: 20,
            right: 0,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 230,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40)
                    ]),
              ),
            )),
        Image(image: AssetImage(shoeModel.assetImage)),
      ]),
    );
  }
}

class _SizeShoe extends StatelessWidget {
  const _SizeShoe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizeBoxShoe(number: 7),
          _SizeBoxShoe(number: 7.5),
          _SizeBoxShoe(number: 8),
          _SizeBoxShoe(number: 8.5),
          _SizeBoxShoe(number: 9),
          _SizeBoxShoe(number: 9.5),
        ],
      ),
    );
  }
}

class _SizeBoxShoe extends StatelessWidget {
  const _SizeBoxShoe({Key? key, required this.number}) : super(key: key);

  final double number;


  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ModelShoe>(context);
    return GestureDetector(child: Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: number != shoeModel.size ? Colors.white : Color(0xFFF1A23A),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (number == shoeModel.size)
            const BoxShadow(
                color: Color(0xFFF1A23A), blurRadius: 10, offset: Offset(0, 5))
        ],
      ),
      child: Text(
        '${number.toString().replaceAll('.0', '')}',
        style: TextStyle(
            color: number != shoeModel.size ? Color(0xFFF1A23A) : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    ), onTap: (){
      final shoeModel = Provider.of<ModelShoe>(context, listen: false);
      shoeModel.size = number;
    },);
  }
}
