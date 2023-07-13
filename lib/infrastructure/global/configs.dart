import 'package:flutter/Material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import '../../theme/theme.dart';
import '../models/user.dart';
import '../repository/local_storage_repository.dart';

Future<void> initAppConfigs() async {
  WidgetsFlutterBinding.ensureInitialized();

  Themes.systemOrientation;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: ThemeMode.system == ThemeMode.dark ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: ThemeMode.system == ThemeMode.dark ? Brightness.light : Brightness.dark,
    ),
  );

  try {
    await localStorageProvider.initDB;
  } catch (e) {
    if(kDebugMode){
      print(e);
    }
  }
}

const List<String> allowedExtensions = ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png', 'xls', 'xlsx', 'txt'];

const List<CollectionSchema<dynamic>> schemas = [UserSchema];