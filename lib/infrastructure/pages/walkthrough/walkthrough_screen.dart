import 'package:flutter/Material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sales_force/infrastructure/repository/local_storage_repository.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../values/values.dart';
import '../../routes/routes.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;

  List<Widget> screens = [
    const _BuildPage(title: Strings.WALKTHROUGH_TITLE_1, description: Strings.WALKTHROUGH_DESC_1, image: Images.onboard1),
    const _BuildPage(title: Strings.WALKTHROUGH_TITLE_2, description: Strings.WALKTHROUGH_DESC_2, image: Images.onboard2),
    const _BuildPage(title: Strings.WALKTHROUGH_TITLE_3, description: Strings.WALKTHROUGH_DESC_3, image: Images.onboard3),
  ];

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: screens,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_30, vertical: Sizes.PADDING_50),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: screens.length,
                        effect: ExpandingDotsEffect(activeDotColor: Theme.of(context).primaryColor, dotHeight: Sizes.HEIGHT_10, dotWidth: Sizes.WIDTH_12, expansionFactor: 4),
                      ),
                      const SizedBox(height: Sizes.PADDING_10),
                      Text(Strings.SKIP, style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                    radius: Sizes.RADIUS_36,
                    percent: (_pageController.hasClients ? _pageController.page ?? 0 : 0) > 0 ? (_pageController.hasClients ? _pageController.page ?? 0 : 0) / (screens.length - 1) : 0.01,
                    progressColor: Theme.of(context).primaryColor,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Padding(
                      padding: const EdgeInsets.all(Sizes.PADDING_1),
                      child: FloatingActionButton(
                        onPressed: () {
                          if (_pageController.hasClients) {
                            if ((_pageController.page ?? 0) < screens.length - 1) {
                              _pageController.nextPage(duration: 200.ms, curve: Curves.easeIn);
                            } else {
                              _animationController.reverse().then((value) async {
                                await localStorageProvider.setFirstTime(false).then((_) => Navigator.pushReplacementNamed(context, Routes.loginScreen));
                              });
                            }
                          }
                        },
                        shape: const CircleBorder(),
                        child: const Icon(Icons.arrow_forward, color: white),
                      ),
                    )).animate(controller: _animationController).scale(begin: Offset.zero, duration: 200.ms),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BuildPage extends StatefulWidget {
  final String title;
  final String description;
  final String image;

  const _BuildPage({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  @override
  State<_BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<_BuildPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<_BuildPage> {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: 100.ms);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(Sizes.PADDING_30, Sizes.PADDING_50, Sizes.PADDING_30, Sizes.PADDING_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset(widget.image, fit: BoxFit.cover),
            ),
          ).animate(controller: _animationController).fadeIn(duration: 200.ms).slideX(begin: 0.5, end: 0.0),
          const SizedBox(height: Sizes.PADDING_30),
          Text(widget.title, style: Theme.of(context).textTheme.headlineLarge!),
          const SizedBox(height: Sizes.PADDING_10),
          Container(
            width: Sizes.WIDTH_80,
            height: Sizes.HEIGHT_6,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(Sizes.RADIUS_10)),
          ),
          const SizedBox(height: Sizes.PADDING_30),
          Text(widget.description, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
