import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              height: 300,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 40),
          Text(
            l10n!.appTitle,
            style: GoogleFonts.quicksand(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          Text(
            l10n.welcomeMessage,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(color: Colors.black, fontSize: 14.0),
          ),
          const SizedBox(height: 40),
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
