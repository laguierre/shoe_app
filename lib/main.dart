import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/scr/models/shoe_model.dart';
import 'scr/pages/shoes_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=> ModelShoe())
  ], child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes APP',
      debugShowCheckedModeBanner: false,
      home: ShoesPage(),
    );
  }
}
