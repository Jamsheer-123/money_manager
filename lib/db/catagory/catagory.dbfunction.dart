import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:money_manager/model/catagory.model/catagory.model.dart';

abstract class CatagoryDBSevice {
  Future<List<CatagoryModel>> getCatagory();
  Future<List<CatagoryModel>> addCatagory(CatagoryModel catagoryModel);
  Future<List<CatagoryModel>> getSpecifiedCatgory(CatagoryType catagoryType);
}

@LazySingleton(as: CatagoryDBSevice)
class CatagoryBD implements CatagoryDBSevice {
  List<CatagoryModel> catagoryList = [];
  @override
  Future<List<CatagoryModel>> getCatagory() async {
    var catagoryDB = await Hive.openBox<CatagoryModel>("catagorymodeldb");
    return catagoryDB.values.toList();
  }

  @override
  Future<List<CatagoryModel>> addCatagory(CatagoryModel catagoryModel) async {
    try {
      final catagoryDB = await Hive.openBox<CatagoryModel>("catagorymodeldb");
      await catagoryDB.put(catagoryModel.id, catagoryModel);
      catagoryList.clear;
      // catagoryList.addAll(catagoryDB.values);
      // log("${catagoryDB.values.length}-------------------");

      return catagoryDB.values.toList();
    } catch (e) {
      log(e.toString());
      throw (e.toString());
    }
  }

  @override
  Future<List<CatagoryModel>> getSpecifiedCatgory(
      CatagoryType catagoryType) async {
    final catagoryDB = await Hive.openBox<CatagoryModel>("catagorymodeldb");

    return catagoryDB.values
        .where((category) => category.catagoryType == catagoryType)
        .toList();
  }
}
