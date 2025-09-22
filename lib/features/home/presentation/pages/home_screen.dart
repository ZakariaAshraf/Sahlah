import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/data/services/firestore_service.dart';
import 'package:sahlah/features/home/presentation/pages/category_screen.dart';
import 'package:sahlah/features/home/presentation/widgets/cheapets_today_widget.dart';
import 'package:sahlah/features/settings/presentation/views/settings_view.dart';

import '../../../../constants/app_colors.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/services/category_service.dart';
import '../../../../l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final List iconsData = [
  //   "assets/icons/bakery.png",
  //   "assets/icons/drinks.png",
  //   "assets/icons/dairy.png",
  //   "assets/icons/fruits.png",
  //   "assets/icons/grains.png",
  //   "assets/icons/oil.png",
  //   "assets/icons/meat.png",
  //   "assets/icons/veg.png",
  // ];
  String location = 'Cairo';
  final List<String> selectedLocation = ["Cairo"];

  // final FirestoreService _service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = CategoryService.getCategories(context);

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
                    width: 290,
                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        // context.read<SearchCubit>().search(value);
                      },
                      placeholder: l10n?.search ?? "Search",
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
              height: 250,
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
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          categories[index].name,
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
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
                padding: EdgeInsets.all(10),
              ),
            ),
              // StreamBuilder<List<CategoryModel>>(
              //   stream: _service.getCategories(),
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
              //
              //     // List<CategoryModel> categories = snapshot.data!;
              //     return SizedBox(
              //       height: 250,
              //       child: GridView.builder(
              //         physics: const NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: categories.length,
              //         itemBuilder: (context, index) => InkWell(
              //           onTap: () => Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => CategoryScreen(
              //                 category: categories[index],
              //                 subCategoryIcon: iconsData[index],
              //               ),
              //             ),
              //           ),
              //           child: Column(
              //             children: [
              //               Expanded(
              //                 flex: 2,
              //                 child: Text(
              //                   categories[index].icon,
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 40,
              //                   ),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: Text(
              //                   categories[index].name,
              //                   style: GoogleFonts.quicksand(
              //                     fontSize: 12,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                   textAlign: TextAlign.center,
              //                   maxLines: 2,
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 4,
              //           crossAxisSpacing: 10,
              //           childAspectRatio: 0.8,
              //           mainAxisSpacing: 10,
              //         ),
              //         padding: EdgeInsets.all(10),
              //       ),
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context)!.cheapestToday,
                  style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// -cheapest today container
              CheapestTodayWidget(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: DropdownButtonFormField<String>(
                        value: location,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
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
                              style: GoogleFonts.aBeeZee(
                                color: AppColors.blackSecondary,
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
