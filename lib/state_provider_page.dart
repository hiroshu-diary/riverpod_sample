import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);
  static String title = 'StateProvider';
  static String routeName = 'state-provider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider.notifier);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => counter.update((state) => state + 1),
          child: Text('Count: ${ref.watch(counterProvider)}'),
        ),
      ),
    );
  }
}
