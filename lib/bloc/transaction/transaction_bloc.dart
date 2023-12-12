import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/db/transaction/transaction.db.function.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/utils/datepicking.function.dart';

part 'transaction_bloc.freezed.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

@injectable
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TranScationDBSevice tranScationDBSevice;

  TransactionBloc(this.tranScationDBSevice)
      : super(TransactionState.initial()) {
    on<GetTranscation>((event, emit) async {
      final transactionList = await tranScationDBSevice.getTranScation();
      emit(state.copyWith(transactionList: transactionList));
    });

    on<SelectCatgory>((event, emit) {
      emit(state.copyWith(selectedCatgroyModel: event.catagoryModel));
    });

    on<AddTranScation>((event, emit) async {
      final transactionList =
          await tranScationDBSevice.addTransation(event.transcationModel);
      emit(state.copyWith(transactionList: transactionList));
    });

    // <------------ picking end date ------------>
    on<PickDateEvent>((event, emit) async {
      DateTime date = await selectDate(event.context);
      emit(state.copyWith(selectedDate: date));

      // submit project details
    });
    on<GetGraph>((event, emit) async {
      final flSpotList = await tranScationDBSevice.graphList();

      emit(state.copyWith(flSpot: flSpotList));

      // submit project details
    });
  }
}
