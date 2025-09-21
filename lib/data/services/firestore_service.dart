import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/category_model.dart';
import '../models/price_entry_model.dart';
import '../models/product_model.dart';
import '../models/sub_category.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all categories
  Stream<List<CategoryModel>> getCategories() {
    return _db
        .collection('categories')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CategoryModel.fromFirestore(doc))
              .toList(),
        );
  }

  // Get subcategories for a category
  Stream<List<Subcategory>> getSubcategories(String categoryId) {
    return _db
        .collection('categories/$categoryId/subcategories')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Subcategory.fromFirestore(doc))
              .toList(),
        );
  }

  // Get products for a subcategory
  Stream<List<Product>> getProducts(String categoryId, String subcategoryId) {
    return _db
        .collection(
          'categories/$categoryId/subcategories/$subcategoryId/products',
        )
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList(),
        );
  }

  // Get prices for a product
  Stream<List<PriceEntry>> getPrices(
    String categoryId,
    String subcategoryId,
    String productId,
  ) {
    return _db
        .collection(
          'categories/$categoryId/subcategories/$subcategoryId/products/$productId/prices',
        )
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => PriceEntry.fromFirestore(doc))
              .toList(),
        );
  }

  // Add a new price update
  Future<void> addPrice(
    String categoryId,
    String subcategoryId,
    String productId,
    PriceEntry entry,
      String supermarketId
  ) async {
    final docRef = _db
        .collection('categories')
        .doc(categoryId)
        .collection('subcategories')
        .doc(subcategoryId)
        .collection('products')
        .doc(productId)
        .collection('prices')
        .doc(supermarketId); // 👈 fixed ID

    await docRef.set(entry.toFirestore(), SetOptions(merge: true));
    print("✅ Price set for $supermarketId");
  }
  Future<void> updatePrice({
    required String categoryId,
    required String subcategoryId,
    required String productId,
    required String priceItemId,
    required PriceEntry entry,
  }) async {
    final docRef = _db
        .collection('categories')
        .doc(categoryId)
        .collection('subcategories')
        .doc(subcategoryId)
        .collection('products')
        .doc(productId)
        .collection('prices')
        .doc(priceItemId);

    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      await docRef.update(entry.toFirestore());
      if (kDebugMode) {
        print("✅ Updated price $priceItemId");
      }
    } else {
      await docRef.set(entry.toFirestore());
      if (kDebugMode) {
        print("✅ Added new price $priceItemId");
      }
    }
  }

}
