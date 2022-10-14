import 'package:flutter/material.dart';
import 'package:tutorial_point_learn/pages/product_page.dart';
import 'package:tutorial_point_learn/widget/rating_box.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  final items = Product.getProducts();
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
                  builder: ((context) => ProductPage(item: items[index])),
                ),
              );
            });
      },
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
      Product(
        "Pixel",
        "Pixel is the most feature-full phone ever",
        800,
        "https://picsum.photos/500",
      ),
    );
    items.add(
      Product(
        "Laptop",
        "Laptop is most productive development tool",
        2000,
        "https://picsum.photos/200",
      ),
    );
    items.add(
      Product(
        "Tablet",
        "Tablet is the most useful device ever for meeting",
        1500,
        "https://picsum.photos/200",
      ),
    );
    items.add(
      Product(
        "Pendrive",
        "Pendrive is useful storage medium",
        100,
        "https://picsum.photos/200",
      ),
    );
    items.add(
      Product(
        "Floppy Drive",
        "Floppy drive is useful rescue storage medium",
        20,
        "https://picsum.photos/200",
      ),
    );
    return items;
  }
}

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
