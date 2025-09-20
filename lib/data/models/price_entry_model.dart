import 'package:cloud_firestore/cloud_firestore.dart';

class PriceEntry {
  final String id;
  final String supermarket;
  final double price;
  final String updatedAt;
  // final DateTime updatedAt;
  final String updatedBy;

  PriceEntry({
    required this.id,
    required this.supermarket,
    required this.price,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory PriceEntry.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PriceEntry(
      id: doc.id,
      supermarket: data['supermarket'] ?? '',
      price: (data['price'] as num).toDouble(),
      // updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      // updatedBy: data['updatedBy'] ?? '',
      updatedAt: data['updatedAt'] ??"",
      updatedBy: data['updatedBy'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "supermarket": supermarket,
      "price": price,
      "updatedAt": updatedAt,
      // "updatedAt": Timestamp.fromDate(updatedAt),
      "updatedBy": updatedBy,
    };
  }
}