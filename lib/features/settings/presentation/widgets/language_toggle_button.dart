import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahlah/features/settings/providers/locale_provider.dart';
import 'package:sahlah/features/widgets/settings_toggle_button.dart';

import '../../../../l10n/app_localizations.dart';

class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(localeProvider);
    final isEnglish = locale.languageCode == 'en';
    final l10n = AppLocalizations.of(context);
    return SettingsToggleButton(
      title: l10n!.language,
      value: isEnglish,
      onChanged: (isEnglish) {
        final newLocale = isEnglish ? const Locale('en') : const Locale('ar');
        ref.read(localeProvider.notifier).setLocale(newLocale);
      },
      trueIcon: Icons.abc_sharp,
      falseIcon: Icons.translate_outlined,
    );
  }
}
