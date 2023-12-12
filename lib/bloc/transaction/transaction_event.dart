part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  factory TransactionEvent.chageCatgory() = ChangeCatagory;

  factory TransactionEvent.selectCatgory(
      {required CatagoryModel catagoryModel}) = SelectCatgory;

  //  this event change the  catgory type (radio button)
  factory TransactionEvent.getTranScation() = GetTranscation;

  factory TransactionEvent.pickEndDates({required BuildContext context}) =
      PickDateEvent;

  factory TransactionEvent.addTranScation(
      {required TransactionModel transcationModel}) = AddTranScation;

  factory TransactionEvent.getGraph() = GetGraph;
}
