import 'package:flutter/material.dart';
import 'package:tutorial_point_learn/src/service/Product.dart';
import 'package:tutorial_point_learn/src/widget/rating_box.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: NetworkImage(item.image),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(item.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(item.description),
                    Text("Price: " + item.price.toString()),
                    RatingBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
