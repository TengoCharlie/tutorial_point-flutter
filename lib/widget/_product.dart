import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
      children: [
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
        const ProductBox(
            price: 25,
            name: "My Name",
            description: "my description",
            image: "https://dummyimage.com/300"),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(image),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(description),
                    Text("Price: " + price.toString())
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
