import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.icHome
                              )
                            )
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 2,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(18)
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.icBook
                              )
                            )
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 2,
                          decoration: BoxDecoration(
                            color: kTransparentColor,
                            borderRadius: BorderRadius.circular(18)
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.icCard
                              )
                            )
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 2,
                          decoration: BoxDecoration(
                            color: kTransparentColor,
                            borderRadius: BorderRadius.circular(18)
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.icSettings
                              )
                            )
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 2,
                          decoration: BoxDecoration(
                            color: kTransparentColor,
                            borderRadius: BorderRadius.circular(18)
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}