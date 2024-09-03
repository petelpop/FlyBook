import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/home_page.dart';
import 'package:airplane/views/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String routeName = "main-page";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            HomePage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 30, left: defaultMargin, right: defaultMargin),
                height: 60,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(18)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomBottomNavigationItem(img: Assets.icHome, isSelected: true,),
                    CustomBottomNavigationItem(img: Assets.icBook),
                    CustomBottomNavigationItem(img: Assets.icCard),
                    CustomBottomNavigationItem(img: Assets.icSettings),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}