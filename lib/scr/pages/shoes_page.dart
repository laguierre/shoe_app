import 'package:flutter/material.dart';
import 'package:shoe_app/scr/helpers/helpers.dart';
import 'package:shoe_app/scr/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusDark();
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(text: 'For you'),
          SizedBox(height: 20.0),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(tag: 'shoe-1', child: SizePreviewShoe()),
                DescriptionShoe(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
              ],
            ),
          )),
          AddCart(amount: 180.0),
        ],
      ),
      //body: CustomAppBar(text: 'For you'),
    );
  }
}
