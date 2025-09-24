import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahlah/data/models/product_model.dart';

import '../../../../constants/app_colors.dart';
import '../../../../data/services/firestore_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../widgets/prices_list_widget.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryId;
  final String subCategoryId;
  final FirestoreService _service = FirestoreService();

  ProductsScreen({
    super.key,
    required this.categoryId,
    required this.subCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme =Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(l10n!.products,style:theme.titleLarge,),
      ),
      body: StreamBuilder(
        stream: _service.getProducts(categoryId, subCategoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 250.h,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text("No data available");
          }
          List<Product> products = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) => DefaultTabController(
              length: products.length,
              child: Card(
                color: AppColors.primary,
                child: ExpansionTile(
                  leading: Text(products[index].brand,style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0.sp,
                    fontWeight: FontWeight.bold,
                  ),),
                  title: Text(products[index].name,style: theme.bodyLarge,),
                  subtitle: Text(products[index].size),
                  trailing: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: AppColors.secondary,
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: SizedBox(
                        height: 200.h,
                        child: PricesListWidget(
                          categoryId: categoryId,
                          subcategoryId: subCategoryId,
                          productId: products[index].id,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
