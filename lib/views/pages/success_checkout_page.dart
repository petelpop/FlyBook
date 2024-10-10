import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  static const String routeName = "success-checkout-page";
  const SuccessCheckoutPage({super.key});

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
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imgSuccess
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              text: 'My Bookings', 
              margin: EdgeInsets.only(top: 50),
              width: 220,
              onTap: (){
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
              })
          ],
        ),
      ),
    );
  }
}