import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/constants/app_colors.dart';
import 'package:sahlah/data/models/sub_category.dart';
import 'package:sahlah/data/services/subcategory_service.dart';
import 'package:sahlah/features/home/presentation/pages/products_screen.dart';

import '../../../../data/models/category_model.dart';
import '../../../../data/services/firestore_service.dart';
import '../../../../l10n/app_localizations.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel category;
  final String subCategoryIcon;
  // final FirestoreService _service = FirestoreService();


  const CategoryScreen({
    super.key,
    required this.category,
     required this.subCategoryIcon,
  });

  @override
  Widget build(BuildContext context) {
    final subCategories = SubcategoryService.getSubcategories(context,category.id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name,style: GoogleFonts.aBeeZee(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body:GridView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 2,
          color: AppColors.primary,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsScreen(
                  categoryId: category.id,
                  subCategoryId: subCategories[index].id,
                ),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 70,
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.whitePrimary,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                    ),
                    child:Image.asset(subCategoryIcon),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    subCategories[index].name,
                    style: GoogleFonts.inter(

                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        itemCount: subCategories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
      // StreamBuilder(
      //   stream: _service.getSubcategories(category.id),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Text("Error: ${snapshot.error}");
      //     }
      //
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return SizedBox(
      //         height: 250,
      //         child: Center(child: CircularProgressIndicator()),
      //       );
      //     }
      //
      //     if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Text("No data available");
      //     }
      //     // List<Subcategory> subCategories = snapshot.data!;
      //     return GridView.builder(
      //       itemBuilder: (context, index) => Card(
      //         elevation: 2,
      //         color: AppColors.primary,
      //         child: InkWell(
      //           onTap: () => Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => ProductsScreen(
      //                 categoryId: category.id,
      //                 subCategoryId: subCategories[index].id,
      //               ),
      //             ),
      //           ),
      //           child: Column(
      //             children: [
      //               Align(
      //                 alignment: Alignment.topLeft,
      //                 child: Container(
      //                   width: 70,
      //                   height: 50,
      //                   padding: const EdgeInsets.all(12),
      //                   decoration: const BoxDecoration(
      //                     color: AppColors.whitePrimary,
      //                     borderRadius: BorderRadius.only(
      //                         topRight: Radius.circular(25),
      //                         bottomRight: Radius.circular(25)),
      //                   ),
      //                   child:Image.asset(subCategoryIcon),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 30),
      //                 child: Text(
      //                   subCategories[index].name,
      //                   style: GoogleFonts.inter(
      //
      //                     color: Colors.black,
      //                     fontSize: 18.0,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       itemCount: subCategories.length,
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //       ),
      //       physics: const NeverScrollableScrollPhysics(),
      //       shrinkWrap: true,
      //     );
      //   },
      // ),
    );
  }
}
