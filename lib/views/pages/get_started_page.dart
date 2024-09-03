import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  static String routeName = "get-started-page";
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imgGetStarted),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Fly Like a Bird",
                    style: whiteTextStyle.copyWith(
                        fontSize: 32, fontWeight: semiBold)),
                SizedBox(height: 10),
                Text(
                  "Explore new world with us and let \n yourself get an amazing experiences",
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 80),
                  width: 220,
                  height: 55,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.routeName);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(defaultRadius))),
                    child: Text(
                      'Get Started',
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
