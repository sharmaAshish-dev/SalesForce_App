import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final counterProvider = StateProvider((ref) => 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          // Consumer widget
          child: Text(
            '${ref.read(counterProvider)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // update the provider
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
