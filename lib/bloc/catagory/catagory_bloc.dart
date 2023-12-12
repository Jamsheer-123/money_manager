import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/db/catagory/catagory.dbfunction.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';

part 'catagory_bloc.freezed.dart';
part 'catagory_event.dart';
part 'catagory_state.dart';

@injectable
class CatagoryBloc extends Bloc<CatagoryEvent, CatagoryState> {
  final CatagoryDBSevice catagoryDBSevice;

  CatagoryBloc(this.catagoryDBSevice) : super(CatagoryState.initial()) {
    on<ChangeCatagoryType>((event, emit) {
      if (state.catagoryType == CatagoryType.expense) {
        emit(state.copyWith(catagoryType: CatagoryType.income));
      } else {
        emit(state.copyWith(catagoryType: CatagoryType.expense));
      }
    });

    on<GetCatagory>((event, emit) async {
      final catagoryList = await catagoryDBSevice.getCatagory();

      emit(state.copyWith(catagoryList: catagoryList));
    });

    on<GetSpecifedCatagory>((event, emit) async {
      // this geting income catgory
      final catagoryList1 =
          await catagoryDBSevice.getSpecifiedCatgory(CatagoryType.income);
      emit(state.copyWith(specfiedcatgroyListicome: catagoryList1));

      // this geting expense catgory
      final catagoryList2 =
          await catagoryDBSevice.getSpecifiedCatgory(CatagoryType.expense);
      emit(state.copyWith(spefieldCatagoryListexpense: catagoryList2));
    });

    // Event for add catagory
    on<AddCatagory>((event, emit) async {
      final catagoryList =
          await catagoryDBSevice.addCatagory(event.catagoryModel);

      emit(state.copyWith(catagoryList: catagoryList));
    });
  }
}
