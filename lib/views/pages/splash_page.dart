import 'dart:async';

import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/get_started_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "splash-page";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, GetStartedPage.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.icPlane)))),
            Text(
              "AIRPLANE",
              style: whiteTextStyle.copyWith(
                fontSize: 32,
                fontWeight: medium,
                letterSpacing: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
