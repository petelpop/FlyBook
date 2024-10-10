import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/pages/success_checkout_page.dart';
import 'package:airplane/views/widgets/booking_details_item.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  static const String routeName = 'checkout-page';

  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ///Route
                Container(
                  width: 291,
                  height: 65,
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imgCheckout))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CGK',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          'Tangerang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'TLC',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        Text(
                          'Ciliwung',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          ///Booking Details
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kWhiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Destination Tile
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image:
                                NetworkImage(transaction.destination.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.destination.name,
                            style: blackTextStyle.copyWith(
                                fontWeight: medium, fontSize: 18),
                          ),
                          SizedBox(height: 5),
                          Text(
                            transaction.destination.city,
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          margin: EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.icStar))),
                        ),
                        Text(
                          transaction.destination.rating.toString(),
                          style: blackTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),

                ///BOOKING DETAIL TEXT
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    'Booking Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),

                ///BOOKING DETAIL ITEM
                BookingDetailsItem(
                    title: 'Traveler',
                    valueText: '${transaction.amountOfTraveler} Person',
                    valueColor: kBlackColor),
                BookingDetailsItem(
                    title: 'Seat',
                    valueText: transaction.selectedSeats,
                    valueColor: kBlackColor),
                BookingDetailsItem(
                    title: 'Insurance',
                    valueText: transaction.insurance == true ? "YES" : "NO",
                    valueColor: transaction.insurance == true
                        ? kGreenColor
                        : kRedColor),
                BookingDetailsItem(
                    title: 'Refundable',
                    valueText: transaction.refundable == true ? "YES" : "NO",
                    valueColor: transaction.refundable == true
                        ? kGreenColor
                        : kRedColor),
                BookingDetailsItem(
                    title: 'VAT',
                    valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                    valueColor: kBlackColor),
                BookingDetailsItem(
                    title: 'Price',
                    valueText: NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(transaction.price),
                    valueColor: kBlackColor),
                BookingDetailsItem(
                    title: 'Grand Total',
                    valueText: NumberFormat.currency(
                            locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                        .format(transaction.grandTotal),
                    valueColor: kPrimaryColor),
              ],
            ),
          ),

          ///PAYMENT DETAILS
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kWhiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Details',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 70,
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(Assets.imgCard),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      margin: EdgeInsets.only(right: 6),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage(Assets.icPlane))),
                                    ),
                                    Text(
                                      'Pay',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 16, fontWeight: medium),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'IDR ',
                                            decimalDigits: 0)
                                        .format(state.data.balance),
                                    style: blackTextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: bold,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Current Balance',
                                    style: greyTextStyle.copyWith(
                                        fontSize: 14, fontWeight: light),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return SizedBox();
            },
          ),

          ///PAY NOW BUTTON
          BlocConsumer<TransactionCubit, TransactionState>(
            listener: (context, state) {
              if (state is TransactionSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  SuccessCheckoutPage.routeName, 
                  (route) => false);
              }

              if (state is TransactionFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: kRedColor, content: Text(state.error)));
              }
            },
            builder: (context, state) {
              
              if (state is TransactionLoading) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                );
              }

              return CustomButton(
                text: 'Pay Now',
                onTap: () {
                  context.read<TransactionCubit>().createTransaction(transaction);
                },
                margin: EdgeInsets.only(top: 30),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              "Terms And Conditions",
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }
}
