import 'package:bloc_example/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

main() => runApp(MyApp());

class MyApp extends MaterialApp {
  MyApp({Key? key})
      : super(
            home: BlocProvider(
              create: (ctx) => CounterBloc(),
              child: const HomePage(),
            ),
            key: key);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().add(CounterIncrementEvent()),
          ),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().add(CounterDecrementEvent()),
          )
        ],
      ),
        ///BlocBuilder
        ///BlocListener
        ///BlocConsumer
        body: Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (ctx, state) {
          return Text(state.counter.toString(), style: Theme.of(context).textTheme.headline4,);
        },
      ),
    ));
  }
}
