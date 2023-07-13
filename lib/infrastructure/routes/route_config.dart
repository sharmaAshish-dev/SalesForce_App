part of routes;

class RouteConfig {
  // main Router
  static List<Path> paths = [
    Path(Routes.splashScreen, (context, arguments) => const SplashScreen()),
    Path(Routes.walkthroughScreen, (context, arguments) => const WalkthroughScreen()),
    Path(Routes.loginScreen, (context, arguments) => const LoginScreen()),
    Path(Routes.mainScreen, (context, arguments) => const MainScreen()),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (var path in paths) {
      if (path.routePath == settings.name) {
        return MaterialPageRoute(
          builder: (context) => path.builder(context, settings.arguments),
          settings: settings,
        );
      }
    }

    // if no route found
    return MaterialPageRoute(
      builder: (context) => const PageNotFound(),
    );
  }
}
