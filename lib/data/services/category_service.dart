import 'package:flutter/cupertino.dart';

import '../../l10n/app_localizations.dart';
import '../models/category_model.dart';

class CategoryService {
  static List<CategoryModel> getCategories(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return [
      CategoryModel(
        id: "bakery",
        name: l10n?.bakery ?? 'Bakery',
        icon: "🍞",
        imagePath: "assets/icons/bakery.png",
      ),
      CategoryModel(
        id: "beverages",
        name: l10n?.drinks ?? 'Beverages',
        icon: "🍵",
        imagePath: "assets/icons/drinks.png",
      ),
      CategoryModel(
        id: "dairy",
        name: l10n?.dairy ?? 'Dairy',
        icon: "🥛",
        imagePath: "assets/icons/dairy.png",
      ),
      CategoryModel(
        id: "fruits",
        name: l10n?.fruits ?? 'Fruits',
        icon: "🍎",
        imagePath: "assets/icons/fruits.png",
      ),
      CategoryModel(
        id: "grains",
        name: l10n?.grains ?? 'Grains & Pasta',
        icon: "🍚",
        imagePath: "assets/icons/grains.png",
      ),
      CategoryModel(
        id: "oils",
        name: l10n?.oil ?? 'Oils & Cooking',
        icon: "🛢️",
        imagePath: "assets/icons/oil.png",
      ),
      CategoryModel(
        id: "protein",
        name: l10n?.meat ?? 'Protein',
        icon: "🍖",
        imagePath: "assets/icons/meat.png",
      ),
      CategoryModel(
        id: "vegetables",
        name: l10n?.vegetables ?? 'Vegetables',
        icon: "🥒",
        imagePath: "assets/icons/veg.png",
      ),
    ];
  }
}
