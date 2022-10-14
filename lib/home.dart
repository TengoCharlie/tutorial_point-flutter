import 'package:flutter/material.dart';
import 'package:tutorial_point_learn/widget/product.dart';
// import 'gesture.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ProductList());
  }
}
