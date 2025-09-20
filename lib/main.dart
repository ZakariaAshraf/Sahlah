import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/features/on_boarding/welcome_screen.dart';

import 'features/add_price/cubits/price_update_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PriceUpdateCubit(),),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sahlah',
        home: WelcomeScreen(),
      ),
    );
  }
}
