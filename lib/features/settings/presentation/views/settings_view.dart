import 'package:flutter/material.dart';
import 'package:sahlah/features/settings/presentation/widgets/language_toggle_button.dart';
import 'package:sahlah/features/settings/presentation/widgets/theme_toggle_button.dart';

import '../../../../l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme =Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n!.settings,
          style: theme.bodyLarge,
        ),
      ),
      body: ListView(
        children: [
         ThemeToggleButton(),
         LanguageToggleButton(),
        ],
      ),
    );
  }
}
