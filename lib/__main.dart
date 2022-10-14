import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
        title: "Animation demo",
        theme: ThemeData(primarySwatch: Colors.amber),
        home: MyHomePage(title: "Product Animation", animation: animation));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyAnimatedWidget extends StatelessWidget {
  const MyAnimatedWidget(
      {Key? key, required this.child, required this.animation})
      : super(key: key);

  final Widget child;
  final Animation animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        child: Opacity(
          opacity: animation.value,
          child: child,
        ),
      ),
      child: child,
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title, required this.animation})
      : super(key: key);

  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: ProductBox(
                    name: "iPhone",
                    description: "iPhone is the stylist phone ever",
                    price: 1000,
                    image: "https://dummyimage.com/500"),
                opacity: animation),
            MyAnimatedWidget(
                child: ProductBox(
                    name: "Pixel",
                    description: "Pixel is the most featureful phone ever",
                    price: 800,
                    image: "https://dummyimage.com/500"),
                animation: animation),
            ProductBox(
                name: "Laptop",
                description: "Laptop is most productive development tool",
                price: 2000,
                image: "https://dummyimage.com/500"),
            ProductBox(
                name: "Tablet",
                description:
                    "Tablet is the most useful device ever for meeting",
                price: 1500,
                image: "https://dummyimage.com/500"),
            ProductBox(
                name: "Pendrive",
                description: "Pendrive is useful storage medium",
                price: 100,
                image: "https://dummyimage.com/500"),
            ProductBox(
                name: "Floppy Drive",
                description: "Floppy drive is useful rescue storage medium",
                price: 20,
                image: "https://dummyimage.com/500"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.network(image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
