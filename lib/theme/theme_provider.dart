import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) => ThemesProvider());

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider() : super(ThemeMode.system){
    state = ThemeMode.system;
  }

  void changeTheme({bool isDark = false}) => state = isDark ? ThemeMode.dark : ThemeMode.light;

  bool get isThemeDark => state == ThemeMode.dark;
}
