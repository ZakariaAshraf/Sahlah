import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahlah/features/settings/providers/theme_provider.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../widgets/settings_toggle_button.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final l10n = AppLocalizations.of(context);
    final themeMode = ref.watch(themeProvider);
    final isLight = themeMode == ThemeMode.light;
    return SettingsToggleButton(
      title: l10n!.themeMode,
      falseIcon: Icons.dark_mode_outlined,
      trueIcon: Icons.light_mode_outlined,
      value: isLight,
      onChanged: (isLight) {
        ref.read(themeProvider.notifier).state =
        isLight ? ThemeMode.light : ThemeMode.dark;
      },
      trueLabel: 'Light',
      falseLabel: 'Dark',
    );
  }
}
