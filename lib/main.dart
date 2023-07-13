import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_force/infrastructure/global/providers.dart';
import 'package:sales_force/theme/theme.dart';
import 'package:sales_force/theme/theme_provider.dart';
import 'package:sales_force/values/values.dart';

import 'infrastructure/global/configs.dart';
import 'infrastructure/routes/routes.dart';

Future<void> main() async {
  await initAppConfigs();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appVersionProvider);
    return MaterialApp(
      title: Strings.APP_NAME,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ref.watch(themesProvider),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}
