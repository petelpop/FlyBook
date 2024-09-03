import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:flutter/material.dart';

class BonusPage extends StatelessWidget {
  static const String routeName = "bonus-page";
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imgCard),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextStyle.copyWith(
                                fontWeight: light
                              ),
                            ),
                            Text(
                              'Kezia Anne',
                              style: whiteTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20
                              ),
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: EdgeInsets.only(right: 6),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Assets.icPlane
                            )
                            )
                        ),
                      ),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16, 
                          fontWeight: medium
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 41),
                  Text(
                    'Balance',
                    style: whiteTextStyle.copyWith(
                      fontWeight: light
                    ),
                  ),
                  Text(
                    'IDR 280.000.000',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 26
                    ),
                  )
                ],
              ),
            ),
                                  Container(
                        margin: EdgeInsets.only(top: 80),
                        child: Text(
                          'Big Bonus 🎉',
                          style: blackTextStyle.copyWith(
                            fontSize: 32, 
                            fontWeight: semiBold
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "We give you early credit so that\nyou can buy a flight ticket",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 220,
                        height: 55,
                        child: TextButton(
                          onPressed:() {
                            Navigator.pushNamed(context, MainPage.routeName);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(defaultRadius),
                            )
                          ), 
                        child: Text(
                          'Start Fly Now !',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium
                          ),
                        )),
                      )
          ],
        ),
      ),
    );
  }
}
