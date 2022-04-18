import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/mvvm/home_page_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(homePageNotifierProvider);
    final pageNotifier = ref.watch(homePageNotifierProvider.notifier);
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('Main Count ${pageState.mainCount}'),
            onTap: pageNotifier.increaseMainCount,
          ),
          ListTile(
            title: Text('Sub Count ${pageState.subCount}'),
            onTap: pageNotifier.increaseSUbCount,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageNotifier.resetAllCount,
        child: const Icon(Icons.exposure_zero),
      ),
    );
  }
}
