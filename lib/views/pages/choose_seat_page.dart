import 'dart:collection';

import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/checkout_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:airplane/views/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  static const String routeName = 'choose-seat-page';

  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {super.key});

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

          ///SEAT
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
          BlocBuilder<SeatCubit, List<String>>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kWhiteColor),
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
                            id: 'A1',
                            isAvailable: false,
                          ),
                          SeatItem(
                            id: 'B1',
                            isAvailable: false,
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
                            id: 'C1',
                          ),
                          SeatItem(
                            id: 'D1',
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
                            id: 'A2',
                          ),
                          SeatItem(
                            id: 'B2',
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
                            id: 'C2',
                          ),
                          SeatItem(
                            id: 'D2',
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
                            id: 'A3',
                          ),
                          SeatItem(
                            id: 'B3',
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
                            id: 'C3',
                          ),
                          SeatItem(
                            id: 'D3',
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
                            id: 'A4',
                          ),
                          SeatItem(
                            id: 'B4',
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
                            id: 'C4',
                          ),
                          SeatItem(
                            id: 'D4',
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
                            id: 'A5',
                          ),
                          SeatItem(
                            id: 'B5',
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
                            id: 'C5',
                          ),
                          SeatItem(
                            id: 'D5',
                          ),
                        ],
                      ),
                    ),

                    ///YOUR SEAT
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Seat',
                            style: greyTextStyle.copyWith(fontWeight: light),
                          ),
                          Text(
                            state.isNotEmpty ? state.join(', ') : '-',
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium),
                          )
                        ],
                      ),
                    ),

                    ///TOTAL
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: greyTextStyle.copyWith(fontWeight: light),
                          ),
                          Text(
                             NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(state.length * destination.price),
                            style: purpleTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          CustomButton(
            text: 'Continue To Checkout',
            onTap: () {
              Navigator.pushNamed(context, CheckoutPage.routeName);
            },
            margin: EdgeInsets.only(top: 30, bottom: 46),
          )
        ],
      ),
    );
  }
}
