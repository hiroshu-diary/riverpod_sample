import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class ListenProviderPage extends ConsumerWidget {
  const ListenProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(
      counterProvider,
      (previous, next) {
        if (next.isEven) {
          return;
        }
        showDialog<void>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Current number is Odd !!'),
            );
          },
        );
      },
      onError: (error, stackTrace) => debugPrint('$error'),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Listen Provider')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Count: ${ref.watch(counterProvider)}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const Gap(32),
                ElevatedButton(
                  onPressed: () => ref
                      .read(counterProvider.notifier)
                      .update((state) => state + 1),
                  child: const Text('Increment'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
