import 'package:flutter/material.dart';
import 'package:tutorial_point_learn/src/pages/product_page.dart';
import 'package:tutorial_point_learn/src/service/Product.dart';
import 'package:tutorial_point_learn/src/widget/product_box.dart';

class ProductBoxList extends StatelessWidget {
  final List<Product> items;
  ProductBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ProductBox(item: items[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(item: items[index]),
              ),
            );
          },
        );
      },
    );
  }
}
