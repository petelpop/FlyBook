import 'package:airplane/models/transaction.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          );
  }
}