import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/price_entry_model.dart';
import '../models/product_model.dart';
import '../models/sub_category.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all categories
  Stream<List<CategoryModel>> getCategories() {
    return _db.collection('categories').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => CategoryModel.fromFirestore(doc)).toList(),
    );
  }

  // Get subcategories for a category
  Stream<List<Subcategory>> getSubcategories(String categoryId) {
    return _db.collection('categories/$categoryId/subcategories').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => Subcategory.fromFirestore(doc)).toList(),
    );
  }

  // Get products for a subcategory
  Stream<List<Product>> getProducts(String categoryId, String subcategoryId) {
    return _db.collection('categories/$categoryId/subcategories/$subcategoryId/products').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList(),
    );
  }

  // Get prices for a product
  Stream<List<PriceEntry>> getPrices(String categoryId, String subcategoryId, String productId) {
    return _db
        .collection('categories/$categoryId/subcategories/$subcategoryId/products/$productId/prices')
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PriceEntry.fromFirestore(doc)).toList());
  }

  // Add a new price update
  Future<void> addPrice(String categoryId, String subcategoryId, String productId, PriceEntry entry) async {
    await _db
        .collection('categories/$categoryId/subcategories/$subcategoryId/products/$productId/prices')
        .add(entry.toFirestore());
  }
}
