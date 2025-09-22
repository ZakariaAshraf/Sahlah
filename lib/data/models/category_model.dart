import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final String? imagePath;

  CategoryModel( {required this.id, required this.name, required this.icon,this.imagePath,});

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      name: data['name'] ?? '',
      icon: data['icon'] ?? '',
      // imagePath: data['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "icon": icon,
    };
  }
}


