import 'dart:ui';

import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../values/values.dart';
import 'dashboard/dashboard_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> with SingleTickerProviderStateMixin {
  final currentPage = StateProvider<int>((ref) => 0);
  late TabController tabController;
  List<IconData> icons = const [CupertinoIcons.person_2, CupertinoIcons.home, CupertinoIcons.gear];

  @override
  void initState() {
    tabController = TabController(length: icons.length, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != ref.read(currentPage) && mounted) {
          ref.read(currentPage.notifier).state = value;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.background.withOpacity(0.1),
              automaticallyImplyLeading: false,
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(Strings.TEST_IMAGE),
                radius: Sizes.RADIUS_24,
              ),
              leadingWidth: 90,
              titleSpacing: Sizes.WIDTH_0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ashish',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: Sizes.TEXT_SIZE_24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You'r doing great!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
        ),
      ),
      body: FrostedBottomBar(
        opacity: 0.6,
        sigmaX: 5,
        sigmaY: 5,
        bottomBarColor: Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(milliseconds: 100),
        hideOnScroll: true,
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(color: Colors.red),
            DashboardScreen(scrollController: controller),
            Container(color: Colors.greenAccent),
          ],
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_8, vertical: Sizes.PADDING_0),
          controller: tabController,
          indicator: UnderlineTabIndicator(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: Sizes.WIDTH_6, style: BorderStyle.solid),
            insets: const EdgeInsets.symmetric(vertical: Sizes.PADDING_2),
          ),
          onTap: (index) {
            if (index != ref.read(currentPage)) {
              ref.read(currentPage.notifier).state = index;
              tabController.animateTo(index);
            }
          },
          tabs: [
            for (int i = 0; i < icons.length; i++)
              Tab(
                icon: TabsIcon(
                  icons: icons[i],
                  color: ref.watch(currentPage) == i ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.onBackground,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon({Key? key, this.color = Colors.white, this.height = 70, this.width = 50, required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
          size: Sizes.ICON_SIZE_26,
        ),
      ),
    );
  }
}
