// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../bloc/catagory/catagory_bloc.dart' as _i6;
import '../bloc/transaction/transaction_bloc.dart' as _i5;
import '../db/catagory/catagory.dbfunction.dart' as _i3;
import '../db/transaction/transaction.db.function.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.CatagoryDBSevice>(() => _i3.CatagoryBD());
  gh.lazySingleton<_i4.TranScationDBSevice>(() => _i4.TranScation());
  gh.factory<_i5.TransactionBloc>(
      () => _i5.TransactionBloc(get<_i4.TranScationDBSevice>()));
  gh.factory<_i6.CatagoryBloc>(
      () => _i6.CatagoryBloc(get<_i3.CatagoryDBSevice>()));
  return get;
}
