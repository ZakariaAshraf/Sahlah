import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sahlah/features/on_boarding/welcome_screen.dart';
import 'package:sahlah/features/settings/providers/locale_provider.dart';
import 'package:sahlah/features/settings/providers/theme_provider.dart';

import 'features/price_operations/cubits/price_update_cubit.dart';
import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,ref) {
    final locale =ref.watch(localeProvider);
    final theme =ref.watch(themeProvider);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PriceUpdateCubit(),),],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          themeMode: theme,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          title: 'Sahlah',
          home: WelcomeScreen(),
        ),
      ),
    );
  }
}
