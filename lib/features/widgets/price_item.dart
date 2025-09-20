import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/constants/app_colors.dart';
import '../../data/models/price_entry_model.dart';
import '../add_price/presentation/pages/add_price_screen.dart';

class PriceItem extends StatelessWidget {
  final PriceEntry entry;
  final String? categoryId;
  final String? subcategoryId;
  final String? productId;

  const PriceItem({
    super.key,
    required this.entry,
    this.categoryId,
    this.productId,
    this.subcategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffE8E9EB),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.supermarket,
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${entry.price}",
                  style: GoogleFonts.aBeeZee(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  text: "Last updated ",
                  style: GoogleFonts.inter(
                    color: AppColors.blackSecondary,
                    fontSize: 11.0,
                    fontWeight: FontWeight.normal
                  ),
                  children: [
                    TextSpan(
                      text: formatDate(DateTime.parse(entry.updatedAt)),
                      style: GoogleFonts.inter(
                        color: Colors.red,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.blackSecondary),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AddPriceScreen(),));
                    },
                    child: Text(
                      "Update price",
                      style: GoogleFonts.inter(
                        color: AppColors.blackSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
