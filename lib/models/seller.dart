class Seller {
  int? id;
  String? name;
  String? email;
  String? image;
  String? address;
  String? description;

  Seller.fromMap(Map<dynamic, dynamic> map) {
    id = int.tryParse(map['id'].toString()) ?? 0; 
    name = map['name'];
    email = map.containsKey('email') ? map['email'] : null;
    image = map['image'];
    address = map['address'];
    description = map.containsKey('description') ? map['description'] : null;
  }
}
