import 'package:flutter/material.dart';
// Removed google_fonts to reduce APK size
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahlah/constants/app_colors.dart';

import '../../l10n/app_localizations.dart';
import '../home/presentation/pages/home_screen.dart';
import '../widgets/primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(
            child: Image.asset(
              "assets/images/start.jpg",
              height: 300.h,
              width: 300.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 40.h),
          Text(
            l10n!.appTitle,
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          Text(
            l10n.welcomeMessage,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14.0.sp),
          ),
          SizedBox(height: 40.h),
          PrimaryButton(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
            },
            title: l10n.letsShop,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
