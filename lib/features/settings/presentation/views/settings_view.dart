import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sahlah/features/settings/presentation/widgets/language_toggle_button.dart';
import 'package:sahlah/features/widgets/settings_toggle_button.dart';

import '../../../../l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n!.settings,
          style: GoogleFonts.aBeeZee(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          SettingsToggleButton(
            title: l10n.themeMode,
            falseIcon: Icons.dark_mode_outlined,
            trueIcon: Icons.light_mode_outlined, value: true, onChanged: (bool value) {  },
          ),
         LanguageToggleButton(),
        ],
      ),
    );
  }
}
