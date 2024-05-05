import 'package:become_to_flutter_dev/feature/country/presenter/bloc/country_bloc.dart';
import 'package:become_to_flutter_dev/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryScreen extends ConsumerStatefulWidget {
  const CountryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          children: [
            Text('${ref.watch<Controller>(controllerProvider).counter}'),
            ref.watch(controllerNotifierProvider).when(
                  data: (data) => Text(data),
                  error: (e, s) => Text('Ah pasado un error $e'),
                  loading: () => const CircularProgressIndicator(),
                )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonRef(),
    );
  }
}

class FloatingActionButtonRef extends ConsumerWidget {
  const FloatingActionButtonRef({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref.read<Controller>(controllerProvider).update(),
    );
  }
}
