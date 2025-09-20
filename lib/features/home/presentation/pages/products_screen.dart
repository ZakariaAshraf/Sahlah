import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/data/models/product_model.dart';

import '../../../../constants/app_colors.dart';
import '../../../../data/services/firestore_service.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: _service.getProducts(categoryId, subCategoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 250,
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
                  leading: Text(products[index].brand,style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  title: Text(products[index].name,style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  subtitle: Text(products[index].size),
                  trailing: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: AppColors.secondary,
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 200,
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
