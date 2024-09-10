import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/home_page.dart';
import 'package:airplane/views/pages/setting_page.dart';
import 'package:airplane/views/pages/transaction_page.dart';
import 'package:airplane/views/pages/wallet_page.dart';
import 'package:airplane/views/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  static const String routeName = "main-page";
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    @override
    Widget buildContent(int currentIndex){
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
        return TransactionPage();
        case 2:
        return WalletPage();
        case 3:
        return SettingPage(); 
        default:
        return HomePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: 30, left: defaultMargin, right: defaultMargin),
                  height: 60,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBottomNavigationItem(
                        img: Assets.icHome,
                        index: 0,
                      ),
                      CustomBottomNavigationItem(img: Assets.icBook, index: 1,),
                      CustomBottomNavigationItem(img: Assets.icCard, index: 2,),
                      CustomBottomNavigationItem(img: Assets.icSettings, index: 3,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
