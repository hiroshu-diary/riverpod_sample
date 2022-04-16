import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/change_notifier/counter.dart';

class CounterHook extends HookConsumerWidget {
  const CounterHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      body: Text('Count: ${counter.count}'),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increase,
        child: const Icon(Icons.add),
      ),
    );
  }
}
