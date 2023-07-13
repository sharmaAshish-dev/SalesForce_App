library routes;

import 'package:flutter/Material.dart';
import 'package:sales_force/infrastructure/pages/error_screens/page_not_found.dart';

import '../pages/auth/login_screen.dart';
import '../pages/splash_screen.dart';
import '../pages/walkthrough/walkthrough_screen.dart';

part 'route_config.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, dynamic);

class Path {
  final String routePath;
  final PathWidgetBuilder builder;
  final Route<dynamic>? pageRoute;

  Path(this.routePath, this.builder, {this.pageRoute});
}

class Routes {
  static const String splashScreen = '/';
  static const String walkthroughScreen = '/walkthroughScreen';
  static const String loginScreen = '/loginScreen';
}
