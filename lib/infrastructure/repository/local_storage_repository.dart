import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sales_force/infrastructure/global/configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

final localStorageProvider = LocalStorageRepository.instance;

class LocalStorageRepository {
  // ignore: default constructor
  LocalStorageRepository._privateConstructor();
  static final LocalStorageRepository _instance = LocalStorageRepository._privateConstructor();
  static LocalStorageRepository get instance => _instance;

  // member variables
  late Isar isarInstance;
  late SharedPreferences prefs;

  // member methods
  Future<void> get initDB async {
    try {
      prefs = await SharedPreferences.getInstance();
      final dir = await getApplicationDocumentsDirectory();
      isarInstance = await Isar.open(schemas, directory: dir.path);
    } catch (e) {
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> clearDB() async {
    try {
      await prefs.clear();
      await isarInstance.clear();
    } catch (e) {
      if(kDebugMode){
        print(e);
      }
    }
  }

  bool get isFirstTime => prefs.getBool("isFirstTime") ?? true;

  Future<void> setFirstTime(bool isFirstTime) async => await prefs.setBool("isFirstTime", isFirstTime);
}
