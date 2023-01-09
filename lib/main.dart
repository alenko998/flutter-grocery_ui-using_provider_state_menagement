// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_cart_ui/models/shopping_cart_model.dart';
import 'package:grocery_cart_ui/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
