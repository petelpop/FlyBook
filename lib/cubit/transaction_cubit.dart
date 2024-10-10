import 'package:airplane/models/transaction.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  TransactionService service = TransactionService();

  void createTransaction(TransactionModel transaction) async{
    try {
      emit(TransactionLoading());
      await service.createTransaction(transaction);
      emit(TransactionSuccess());
    } catch (e) {
      emit(TransactionFailed('error: $e'));
    }
  }
}
