import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String brand;
  final String size;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.size,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      name: data['name'] ?? '',
      brand: data['brand'] ?? '',
      size: data['size'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "brand": brand,
      "size": size,
    };
  }
}
