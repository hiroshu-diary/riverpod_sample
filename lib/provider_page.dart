import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);
final doubleCountProvider = Provider<int>((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);
  static const String title = 'ProviderPage';
  static const String routeName = 'provider-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doubleCount = ref.watch(doubleCountProvider);
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '２倍されたカウント',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$doubleCount',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => state + 1);
              },
              child: const Text('Increase Count'),
            ),
          ],
        ),
      ),
    );
  }
}
