import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tutorial_point_learn/src/service/Product.dart';
import 'package:tutorial_point_learn/src/widget/product_box_list.dart';

void main() {
  runApp(MyApp(products: fetchProducts()));
}

List<Product> parseProduct(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/product.json'));
  if (response.statusCode == 200) {
    return parseProduct(response.body);
  } else {
    throw Exception('Unable to fetch products front REST API');
  }
}

class MyApp extends StatelessWidget {
  final Future<List<Product>>? products;
  const MyApp({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(
        title: "My Rest API App",
        products: products,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Product>>? products;
  const MyHomePage({super.key, this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My App rest"),
        ),
        body: Center(
          child: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? ProductBoxList(items: snapshot.data)
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
