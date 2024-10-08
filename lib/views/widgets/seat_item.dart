import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  ///0.Available 1.Selected 2.Unavailable
  final String id;
  final bool isAvailable;
  const SeatItem({
    super.key, 
    this.isAvailable = true,
    required this.id});

  @override
  Widget build(BuildContext context) {

    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if(isSelected){
          return kPrimaryColor; 
        } else {
          return kAvailableColor;
        }
      }
    }

    child() {
     if (isSelected) {
       return Center(
            child: Text(
              'YOU',
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold
                ),
            ),
          );
     } else {
      return SizedBox();
     }
    }

    borderColor() {
        if (!isAvailable) {
        return kUnavailableColor;
      } else {
          return kPrimaryColor; 
        }
      }

    return GestureDetector(
      onTap: (){
        if (isAvailable == true) {
        context.read<SeatCubit>().selecSeat(id);          
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor(),
            width: 2
            )),
            child: child(),
      ),
    );
  }
}
