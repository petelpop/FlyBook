import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget {
  static const String routeName = 'choose-seat-page';
  const ChooseSeatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          /// TITLE
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              'Select Your\nFavorite Seat',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
          ),

          ///SEAT STATUS
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Available
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.icAvailable))),
                    ),
                    Text(
                      'Available',
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                  ],
                ),

                ///Selected
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.icSelected))),
                    ),
                    Text(
                      'Selected',
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                  ],
                ),

                ///Unavailable
                Row(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.icUnavailable))),
                    ),
                    Text(
                      'Unavailable',
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ///Select Seat
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kWhiteColor),
            child: Column(
              children: [
                ///SEAT INDICATOR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),

                ///SEAT 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        status: 2,
                      ),
                      SeatItem(
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                        child: Text(
                          '1',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 2,
                      ),
                    ],
                  ),
                ),

                ///SEAT 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                        child: Text(
                          '2',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 2,
                      ),
                    ],
                  ),
                ),

                ///SEAT 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        status: 1,
                      ),
                      SeatItem(
                        status: 1,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                        child: Text(
                          '3',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 0,
                      ),
                    ],
                  ),
                ),

                ///SEAT 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                        child: Text(
                          '4',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 0,
                      ),
                    ],
                  ),
                ),
                
                ///SEAT 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        status: 0,
                      ),
                      SeatItem(
                        status: 0,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                        child: Text(
                          '5',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      ),
                      SeatItem(
                        status: 2,
                      ),
                      SeatItem(
                        status: 0,
                      ),
                    ],
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
