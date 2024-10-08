import 'package:airplane/models/destination.dart';
import 'package:airplane/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async{
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations = await DestinationService().fetchDestination();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed('error : $e'));
    }
  }
}
