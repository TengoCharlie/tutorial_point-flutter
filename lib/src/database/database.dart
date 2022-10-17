import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import "package:tutorial_point_learn/src/service/Product.dart";

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ProductDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Product ("
          "id INTEGER PRIMARY KEY"
          "name TEXT"
          "description TEXT"
          "price INTEGER"
          "image TEXT"
          ")");
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            1,
            "iPhone",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            2,
            "Dell",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            3,
            "Nokia",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            4,
            "Blackberry",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            5,
            "samsung",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            6,
            "Asus",
            "iPhone is stylist phone ever",
            1000,
            "https://picsum.photos/200"
          ]);
    });
  }

  // Get all
  Future<List<Product>> getAll(String tableName,
      {List<String>? columns}) async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db!.query(tableName, columns: columns, orderBy: "id ASC");

    List<Product> products = [];
    for (var res in result) {
      Product product = Product.fromJson(res);
      products.add(product);
    }

    return products;
  }

  // Get
  Future<dynamic> getProductById(int id, String tableName) async {
    final db = await database;
    var result = await db!.query(tableName, where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Product.fromJson(result.first) : null;
  }

  // Add
  insert(Product product) async {
    final db = await database;
    var maxIdResult =
        await db!.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT INTO Product (id, name ,description, price, image)"
        " VALUES(?, ?, ?, ?, ?)",
        [id, product.name, product.description, product.price, product.image]);
    return result;
  }

  // Update
  update(String tableName, Product product) async {
    final db = await database;
    var result = await db!.update(tableName, product.toJson(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  // delete
  delete(String tableName, int id) async {
    final db = await database;
    db!.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
