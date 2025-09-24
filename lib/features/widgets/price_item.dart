import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahlah/constants/app_colors.dart';
import '../../data/models/price_entry_model.dart';
import '../../l10n/app_localizations.dart';
import '../price_operations/presentation/pages/add_price_screen.dart';

class PriceItem extends StatelessWidget {
  final PriceEntry entry;
  final String categoryId;
  final String subcategoryId;
  final String productId;

  const PriceItem({
    super.key,
    required this.entry,
    required this.categoryId,
    required this.productId,
    required this.subcategoryId,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme =Theme.of(context).textTheme;

    return Card(
      // color: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.supermarket,
                  style: theme.bodyLarge
                ),
                Text(
                  "${l10n?.price(entry.price)}",
                  style: theme.bodyLarge,
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
                  style: theme.bodySmall!.copyWith(color: Colors.red),
                  children: [
                    TextSpan(
                      text: formatDate(DateTime.parse(entry.updatedAt)),
                      style: theme.titleSmall
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.blackSecondary),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPriceScreen(
                            categoryId: categoryId,
                            subcategoryId: subcategoryId,
                            productId: productId,
                            oldPrice:entry.price.toString(),
                            superMarketName: entry.supermarket,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      l10n!.updatePrice,
                      style: theme.bodySmall,
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
