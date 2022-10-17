class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  static final columns = ["id", "name", "description", "price", "image"];
  Product(this.id, this.name, this.description, this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
}
