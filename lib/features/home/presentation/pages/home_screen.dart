import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahlah/features/home/presentation/pages/category_screen.dart';
import 'package:sahlah/features/home/presentation/widgets/cheapets_today_widget.dart';
import 'package:sahlah/features/settings/presentation/views/settings_view.dart';
import '../../../../constants/app_colors.dart';
import '../../../../data/services/category_service.dart';
import '../../../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String location = 'Cairo';
  final List<String> selectedLocation = ["Cairo"];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = CategoryService.getCategories(context);
    final theme =Theme.of(context).textTheme;

    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 310.w,
                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                      },
                      placeholder: l10n!.search,
                      style: theme.titleSmall ,
                    ),
                  ),
                  IconButton(
                    icon: Icon(CupertinoIcons.settings),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsView()),
                      );
                    },
                  ),
                ],
              ),
              ///-icons grid view
            SizedBox(
              height: 320.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        category: categories[index],
                        subCategoryIcon: categories[index].imagePath!,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          categories[index].icon,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          categories[index].name,
                          style: theme.titleSmall,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10.w),
              ),
            ),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Text(
                  AppLocalizations.of(context)!.cheapestToday,
                  style: theme.displayLarge!.copyWith(fontSize: 30.sp),
                ),
              ),
              /// -cheapest today container
              CheapestTodayWidget(),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: theme.displayLarge!.copyWith(fontSize: 30.sp),
                    ),
                    SizedBox(
                      width: 170.w,
                      child: DropdownButtonFormField<String>(
                        value: location,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          labelText: AppLocalizations.of(context)!.location,
                          prefixIcon: const Icon(
                            Icons.pin_drop_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                        items: selectedLocation.map((task) {
                          return DropdownMenuItem(
                            value: task,
                            child: Text(
                              task,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          location = value as String;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select supermarket';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
