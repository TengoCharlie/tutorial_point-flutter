import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tutorial_point_learn/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutorial_point_learn/src/service/Product.dart';
import 'package:tutorial_point_learn/src/widget/product_box_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    products: fetchProducts(),
  ));
}

Stream<QuerySnapshot> fetchProducts() {
  return FirebaseFirestore.instance.collection('Product').snapshots();
}

class MyApp extends StatelessWidget {
  final Stream<QuerySnapshot>? products;
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
  final Stream<QuerySnapshot>? products;
  const MyHomePage({super.key, this.products, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My App rest"),
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: products,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (snapshot.hasData) {
               if(snapshot.data.docs.length>0) {
                  List<DocumentSnapshot> documents = snapshot.data.docs;
                  List<Product> items = <Product>[];
                  for (var i = 0; i < documents.length; i++) {
                    DocumentSnapshot document = documents[i];
                    print(document.data());
                    items.add(Product.fromJson(
                        document.data() as Map<String, dynamic>));
                  }
                  return ProductBoxList(items: items);
                }
               else {
                 return Center(child: CircularProgressIndicator());
               }
              } else {
                return Center(child: CircularProgressIndicator());
              }
              // const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
