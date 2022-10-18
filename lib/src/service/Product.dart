class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  static final columns = [ "name", "description", "price", "image"];
  Product( this.name, this.description, this.price, this.image);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
  Map<String, dynamic> toJson() => {

        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
}
