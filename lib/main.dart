import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/pages/checkout_page.dart';
import 'package:airplane/views/pages/choose_seat_page.dart';
import 'package:airplane/views/pages/detail_page.dart';
import 'package:airplane/views/pages/get_started_page.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:airplane/views/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}