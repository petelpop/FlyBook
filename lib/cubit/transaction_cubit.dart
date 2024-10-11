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
      print('ini state dari create transaction $state');
      emit(TransactionLoading());
      await service.createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed('error: $e'));
    }
  }

  void getTransaction() async{
    try {
      print('ini state dari get transaction $state');
    emit(TransactionLoading());
    List<TransactionModel> transaction  = await service.fetchTransaction();
    emit(TransactionSuccess(transaction));
    } catch (e) {
      throw e;
    }
  }
}
