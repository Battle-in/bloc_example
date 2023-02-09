import 'package:bloc_example/counter/cubit/counter_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.read<CounterCubit>().increment(),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return state.maybeWhen<Widget>(
                initial: () => const FlutterLogo(),
                loading: () => const CircularProgressIndicator(),
                showCount: (int count) => Text(count.toString(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.purple)),
                reset: () => const CircularProgressIndicator(),
                orElse: () {
                  if (kReleaseMode) {
                    return const Text(
                        'message: пользователь, мы обосрались, отпиши в тимсе плиз');
                  } else {
                    throw ArgumentError();
                  }
                });
          },
        ),
      ),
    );
  }
}
