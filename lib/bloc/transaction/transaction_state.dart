part of 'transaction_bloc.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState(
      {required List<TransactionModel> transactionList,
      required bool isLoading,
      required CatagoryModel? selectedCatgroyModel,
      required DateTime? selectedDate,
      required List<FlSpot> flSpot,
      required CatagoryType catagoryType}) = _Initial;

  factory TransactionState.initial() {
    return const TransactionState(
      isLoading: false,
      selectedDate: null,
      selectedCatgroyModel: null,
      transactionList: [],
      catagoryType: CatagoryType.expense,
      flSpot: [],
    );
  }
}
