import 'package:flutter/material.dart';
import 'package:tutorial_point_learn/widget/product.dart';
import 'package:tutorial_point_learn/widget/rating_box.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: ProductPageContents(item: item),
    );
  }
}

class ProductPageContents extends StatelessWidget {
  const ProductPageContents({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(item.image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item.description),
                    Text("Price: " + item.price.toString()),
                    RatingBox()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
