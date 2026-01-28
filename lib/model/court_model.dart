class Court {
  final int id;
  final String name;
  final String image;
  final String type;
  final String facility;
  final double rating;
  final int price;

  Court({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.facility,
    required this.rating,
    required this.price,
  });

 factory Court.fromJson(Map<String, dynamic> json) {
  return Court(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    type: json['type'],
    facility: json['facility'],
    rating: double.parse(json['rating'].toString()),
    price: int.parse(
      double.parse(json['price'].toString()).toStringAsFixed(0),
    ),
  );
}
}