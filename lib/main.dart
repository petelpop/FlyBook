import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/pages/checkout_page.dart';
import 'package:airplane/views/pages/choose_seat_page.dart';
import 'package:airplane/views/pages/detail_page.dart';
import 'package:airplane/views/pages/get_started_page.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:airplane/views/pages/splash_page.dart';
import 'package:airplane/views/pages/success_checkout_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

  void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => SplashPage(),
          GetStartedPage.routeName: (context) => GetStartedPage(),
          SignUpPage.routeName:(context) => SignUpPage(),
          BonusPage.routeName:(context) => BonusPage(),
          MainPage.routeName:(context) => MainPage(),
          DetailPage.routeName:(context) => DetailPage(),
          ChooseSeatPage.routeName:(context) => ChooseSeatPage(),
          CheckoutPage.routeName:(context) => CheckoutPage(),
          SuccessCheckoutPage.routeName:(context) => SuccessCheckoutPage(),
        },
      ),
    );
  }
}