import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/constants/app_colors.dart';
import 'package:sahlah/data/models/price_entry_model.dart';
import 'package:sahlah/features/widgets/price_item.dart';
import '../../data/services/firestore_service.dart';
import '../price_operations/presentation/pages/add_price_screen.dart';

class PricesListWidget extends StatelessWidget {
  final String categoryId;
  final String subcategoryId;
  final String productId;
  final FirestoreService _service = FirestoreService();

  PricesListWidget({
    super.key,
    required this.categoryId,
    required this.subcategoryId,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _service.getPrices(categoryId, subcategoryId, productId),
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
        List<PriceEntry> prices = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    PriceItem(entry: prices[index],productId: productId,subcategoryId: subcategoryId,categoryId: categoryId,),
                itemCount: prices.length,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPriceScreen(
                        categoryId: categoryId,
                        productId: productId,
                        subcategoryId: subcategoryId,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blackSecondary,
                    ),
                    child: Center(
                      child: Text(
                        "Add new",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
