import 'package:avatar_stack/avatar_stack.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/ui/decorators/decorators.dart';
import '../../../../values/values.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  final ScrollController scrollController;
  const DashboardScreen({Key? key, required this.scrollController}) : super(key: key);

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: Sizes.SIZE_16,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          physics: const NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            const TodayLeadTile(title: Strings.TODAY_LEADS, count: 8, goal: 10),
            const TotalLeadTile(title: Strings.OVERALL_LEADS, count: 22),
          ],
        ),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: Sizes.SIZE_16,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_16),
          physics: const NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            const TotalLeadTile(title: Strings.OVERALL_LEADS, count: 22),
            const TodayLeadTile(title: Strings.TODAY_LEADS, count: 8, goal: 10),
          ],
        ),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: Sizes.SIZE_16,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          physics: const NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            const TodayLeadTile(title: Strings.TODAY_LEADS, count: 8, goal: 10),
            const TotalLeadTile(title: Strings.OVERALL_LEADS, count: 22),
          ],
        ),
        GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: Sizes.SIZE_16,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          physics: const NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            const TotalLeadTile(title: Strings.OVERALL_LEADS, count: 22),
            const TodayLeadTile(title: Strings.TODAY_LEADS, count: 8, goal: 10),
          ],
        ),

      ],
    );
  }
}

class TodayLeadTile extends StatefulWidget {
  final int count;
  final int goal;
  final String title;

  const TodayLeadTile({Key? key, required this.count, required this.goal, required this.title}) : super(key: key);

  @override
  State<TodayLeadTile> createState() => _TodayLeadTileState();
}

class _TodayLeadTileState extends State<TodayLeadTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.PADDING_24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${widget.count}", style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: white, fontWeight: FontWeight.bold, fontSize: Sizes.TEXT_SIZE_44)),
          const SizedBox(height: Sizes.HEIGHT_20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${Strings.GOAL}: ${widget.goal}", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white)),
              const SizedBox(height: Sizes.HEIGHT_8),
              LinearPercentIndicator(
                padding: const EdgeInsets.all(Sizes.PADDING_0),
                animation: true,
                lineHeight: 8.0,
                animationDuration: 1500,
                percent: widget.count / widget.goal,
                barRadius: Radius.circular(borderRadius),
                progressColor: white,
              ),
            ],
          ),
          Text(widget.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class TotalLeadTile extends StatefulWidget {
  final int count;
  final String title;

  const TotalLeadTile({Key? key, required this.count, required this.title}) : super(key: key);

  @override
  State<TotalLeadTile> createState() => _TotalLeadTileState();
}

class _TotalLeadTileState extends State<TotalLeadTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.PADDING_24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${widget.count}", style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, fontSize: Sizes.TEXT_SIZE_44)),
          const SizedBox(height: Sizes.HEIGHT_20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarStack(
                height: 40,
                borderColor: white,
                avatars: [
                  for (var n = 0; n < 15; n++)
                    NetworkImage('https://i.pravatar.cc/150?img=$n'),
                ],
              ),
            ],
          ),
          Text(widget.title, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
