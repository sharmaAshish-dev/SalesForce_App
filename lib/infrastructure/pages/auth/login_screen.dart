import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sales_force/infrastructure/global/providers.dart';

import '../../../core/ui/buttons/buttons.dart';
import '../../../values/values.dart';
import '../../routes/routes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final showPassword = StateProvider<bool>((ref) => false);

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(Images.loginBackground), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.loginBackground), fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(Sizes.PADDING_20),
                  child: FlutterLogo(size: 100),
                ),
                Text(
                  Strings.APP_NAME,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: black),
                ),
                Text(
                  Strings.APP_TITLE,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: black),
                ),
                const SizedBox(height: Sizes.HEIGHT_20),
                Expanded(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        padding: const EdgeInsets.all(Sizes.PADDING_20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          border: Border.all(color: Colors.white.withOpacity(0.6)),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_8, vertical: Sizes.PADDING_20),
                          children: [
                            Text(
                              Strings.LOGIN,
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
                            ),
                            const SizedBox(height: Sizes.HEIGHT_100),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(Strings.LOGIN_ID, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: black)),
                                const SizedBox(height: Sizes.HEIGHT_8),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: Strings.LOGIN_ID,
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                const SizedBox(height: Sizes.HEIGHT_20),
                                Text(Strings.PASSWORD, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, color: black)),
                                const SizedBox(height: Sizes.HEIGHT_8),
                                TextFormField(
                                  obscureText: !ref.watch(showPassword),
                                  decoration: InputDecoration(
                                    hintText: Strings.PASSWORD,
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          ref.read(showPassword.notifier).state = !ref.read(showPassword);
                                        },
                                        icon: Icon(ref.watch(showPassword) ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                                        color: black),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.lock, color: black, size: Sizes.ICON_SIZE_20),
                                        const SizedBox(width: Sizes.WIDTH_4),
                                        Text(Strings.FORGOT_PASSWORD, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: black, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: Sizes.HEIGHT_50),
                                SizedBox(
                                  width: double.infinity,
                                  child: PrimaryButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.mainScreen);
                                    },
                                    text: Strings.SIGN_IN,
                                  ),
                                ),
                                const SizedBox(height: Sizes.HEIGHT_60),
                                ref.watch(appVersionProvider).when(data: (data) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${Strings.APP_VERSION} ${data.version}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: black),
                                    ),
                                  );
                                }, loading: () {
                                  return const SizedBox();
                                }, error: (error, stackTrace) {
                                  return const SizedBox();
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animate().fadeIn()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
