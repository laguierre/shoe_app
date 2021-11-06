import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/scr/helpers/helpers.dart';
import 'package:shoe_app/scr/models/shoe_model.dart';
import 'package:shoe_app/scr/widgets/custom_widgets.dart';

class DescriptionShoePage extends StatelessWidget {
  const DescriptionShoePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'shoe-1',
                child: SizePreviewShoe(fullScreen: true),
              ),
              Positioned(
                  top: 80,
                  child: FloatingActionButton(
                      elevation: 0,
                      highlightElevation: 0,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        changeStatusDark();
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.chevron_left,
                          color: Colors.white, size: 60)))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                DescriptionShoe(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                _BuyNow(),
                _Colors(),
                _LikeBtn(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
                delay: Duration(seconds: 1),
                from: 8.0,
                child: OrangeBtn(text: 'Buy now', width: 120, height: 40)),
          ],
        ),
      ),
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90,
                  child: _PointBtn(color: Color(0xFFC6D642), index: 4, url: greenShoe,)), //green
              Positioned(
                  left: 60,
                  child: _PointBtn(color: Color(0xFFFFAD29), index: 3, url: yellowShoe,)), //yellow
              Positioned(
                  left: 30,
                  child: _PointBtn(color: Color(0xFF2099F1), index: 2, url: blueShoe,)), //blue
              _PointBtn(color: Color(0xFF364D56), index: 1, url: blackShoe,),  //black
            ],
          )),
          OrangeBtn(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xFFFFC675),
          ),
        ],
      ),
    );
  }
}

class _PointBtn extends StatelessWidget {
  const _PointBtn({
    Key? key,
    required this.color,
    required this.index, required this.url,
  }) : super(key: key);

  final Color color;
  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          onTap: (){
            final shoeModel = Provider.of<ModelShoe>(context, listen: false);
            shoeModel.assetImage = url;
          },
        ));
  }
}

class _LikeBtn extends StatelessWidget {
  const _LikeBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadowBtn(icon: Icon(Icons.star, color: Colors.red, size: 25)),
          _ShadowBtn(
              icon: Icon(Icons.add_shopping_cart,
                  color: Colors.grey.withOpacity(1), size: 25)),
          _ShadowBtn(
              icon: Icon(Icons.settings,
                  color: Colors.grey.withOpacity(1), size: 25)),
        ],
      ),
    );
  }
}

class _ShadowBtn extends StatelessWidget {
  const _ShadowBtn({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}
