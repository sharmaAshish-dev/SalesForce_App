import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_force/infrastructure/repository/user_repository.dart';

import '../repository/local_storage_repository.dart';
import '../routes/routes.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  var duration = const Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _isUserAuthentic();
  }

  _isUserAuthentic() async {
    if (await userRepositoryProvider.isUserLoggedIn) {
      // await UserHandler().getUserData().then((user) async {
      //   if (user != null) {
      //     await requestData(context, CheckUserAuthentication(UserID: user.userId!, PasswordHash: user.passwordHash ?? "", fcmToken: user.fcmToken ?? "")).then((response) {
      //       bool isUserAuthentic = false;
      //       bool resetState = true;
      //
      //       if (response.statusCode == 200) {
      //         isUserAuthentic = response.data["IsAuthentic"];
      //         resetState = response.data["Reset"];
      //
      //         if (!isUserAuthentic || resetState) {
      //           Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(
      //               builder: (context) => const LoginScreen(),
      //               settings: const RouteSettings(name: "/LoginScreen"),
      //             ),
      //           );
      //         } else {
      //           _initialRoute();
      //         }
      //       } else {
      //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      //       }
      //     });
      //   } else {
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      //   }
      // });
    } else {
      startTime();
    }
  }

  _initialRoute() {
    // Navigator.of(context).pushReplacementNamed(Routes.walkthroughScreen);
    Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
    return;
    if (localStorageProvider.isFirstTime) {
      // if (isUserLoggedIn()) {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => UserHandler.userRoleRoute(),
      //     ),
      //   );
      // } else {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => const LoginScreen(),
      //       settings: const RouteSettings(name: "/LoginScreen"),
      //     ),
      //   );
      // }
    } else {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const WalkThroughScreen(),
      //   ),
      // );
    }
  }

  startTime() => Timer(duration, _initialRoute);

  initScreen(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => initScreen(context);
}
