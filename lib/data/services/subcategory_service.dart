import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../models/sub_category.dart';

class SubcategoryService {
  static List<Subcategory> getSubcategories(
    BuildContext context,
    String categoryId,
  ) {
    final l10n = AppLocalizations.of(context);

    switch (categoryId) {
      case "bakery":
        return [
          Subcategory(id: "bread", name: l10n?.bread ?? "Bread"),
          Subcategory(id: "cakes", name: l10n?.cakes ?? "Cakes"),
          Subcategory(id: "pastries", name: l10n?.pastries ?? "Pastries"),
        ];
      case "beverages":
        return [
          // Subcategory(id: "water", name: l10n?.water ?? "Water"),
          // Subcategory(id: "juices", name: l10n?.juices ?? "Juices"),
          // Subcategory(
          //   id: "soft_drinks",
          //   name: l10n?.softDrinks ?? "Soft Drinks",
          // ),
          Subcategory(
            id: "tea",
            name: l10n?.tea ?? "Tea",
          ),
          Subcategory(
            id: "coffee",
            name: l10n?.coffee ?? "Coffee",
          ),
        ];
      case "dairy":
        return [
          Subcategory(id: "milk", name: l10n?.milk ?? "Milk"),
          Subcategory(id: "cheese", name: l10n?.cheese ?? "Cheese"),
          // Subcategory(id: "yogurt", name: l10n?.yogurt ?? "Yogurt"),
          Subcategory(id: "butter", name: l10n?.butter ?? "Butter"),
        ];
      case "fruits":
        return [
          // Subcategory(id: "citrus", name: l10n?.citrus ?? "Citrus"),
          Subcategory(id: "bananas", name: l10n?.bananas ?? "Bananas"),
          Subcategory(id: "apples", name: l10n?.apples ?? "Apples"),
          // Subcategory(id: "berries", name: l10n?.berries ?? "Berries"),
        ];
      case "grains":
        return [
          Subcategory(id: "rice", name: l10n?.rice ?? "Rice"),
          Subcategory(id: "pasta", name: l10n?.pasta ?? "Pasta"),
          // Subcategory(id: "bread", name: l10n?.bread ?? "Bread"),
          // Subcategory(id: "cereals", name: l10n?.cereals ?? "Cereals"),
        ];
      case "oils":
        return [
          // Subcategory(id: "olive_oil", name: l10n?.oliveOil ?? "Olive Oil"),
          Subcategory(
            id: "sunflower_oil",
            name: l10n?.sunflowerOil ?? "Sunflower Oil",
          ),
          // Subcategory(
          //   id: "butter_ghee",
          //   name: l10n?.butterGhee ?? "Butter & Ghee",
          // ),
        ];
      case "protein":
        return [
          Subcategory(id: "chicken", name: l10n?.chicken ?? "Chicken"),
          // Subcategory(id: "beef", name: l10n?.beef ?? "Beef"),
          // Subcategory(id: "fish", name: l10n?.fish ?? "Fish"),
          Subcategory(id: "eggs", name: l10n?.eggs ?? "Eggs"),
        ];
      case "vegetables":
        return [
          // Subcategory(id: "leafy", name: l10n?.leafy ?? "Leafy Greens"),
          // Subcategory(id: "root", name: l10n?.rootVeg ?? "Root Vegetables"),
          Subcategory(id: "tomatoes", name: l10n?.tomatoes ?? "Tomatoes"),
          // Subcategory(id: "cucumbers", name: l10n?.cucumbers ?? "Cucumbers"),
        ];
      default:
        return [];
    }
  }
}
