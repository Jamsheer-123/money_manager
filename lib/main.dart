import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/bloc/catagory/catagory_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/domain/injectable.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/pages/homelayout/homelayout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/create.transaction/create.transaction.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  if (!Hive.isAdapterRegistered(CatagoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CatagoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CatagoryModelAdapter().typeId)) {
    Hive.registerAdapter(CatagoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryFieldAdapter().typeId)) {
    Hive.registerAdapter(CategoryFieldAdapter());
  }
  bool isInitialized = await SharedPreferences.getInstance()
      .then((prefs) => prefs.getBool('isInitialized') ?? false);

  if (!isInitialized) {
    final catagoryDB = await Hive.openBox<CatagoryModel>("catagorymodeldb");

    for (var category in initialCategories) {
      await catagoryDB.put(category.id, category);
    }

    // Set the flag to indicate that initialization has been done
    await SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool('isInitialized', true));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CatagoryBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<TransactionBloc>(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: false,
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => HomeLayout(),
            "create_transaction": (context) => TranScationScreeen(),
          }),
    );
  }
}
