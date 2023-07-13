class Item {
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final product = [
  Item(
      id: 1,
      name: "Iphone",
      desc: "High price phone",
      color: "black",
      image: "url")
];
