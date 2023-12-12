part of 'catagory_bloc.dart';

@freezed
class CatagoryState with _$CatagoryState {
  const factory CatagoryState(
      {required List<CatagoryModel>? catagoryList,
      required List<CatagoryModel>? specfiedcatgroyListicome,
      required List<CatagoryModel>? spefieldCatagoryListexpense,
      required CatagoryType catagoryType}) = _Initial;

  factory CatagoryState.initial() {
    return const CatagoryState(
      specfiedcatgroyListicome: [],
      spefieldCatagoryListexpense: [],
      catagoryList: null,
      catagoryType: CatagoryType.expense,
    );
  }
}
